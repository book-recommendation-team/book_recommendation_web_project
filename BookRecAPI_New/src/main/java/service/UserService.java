package service;

import java.sql.SQLException;

import dao.UserDao;
import dto.LoginRequest;
import dto.UserProfileUpdateRequest;
import dto.UserRegistrationRequest;
import model.User;
import security.PasswordEncoder;

// 사용자 관련 비즈니스 로직에서 발생할 수 있는 특정 예외들은 각자 별도 파일에 public으로 정의되어 있다고 가정합니다.
// UserLoginException.java
// UserRegistrationException.java
// UserProfileException.java

public class UserService {
	private UserDao userDao;
	private PasswordEncoder passwordEncoder;

	// 생성자를 통한 의존성 주입
	public UserService(UserDao userDao, PasswordEncoder passwordEncoder) {
		this.userDao = userDao;
		this.passwordEncoder = passwordEncoder;
	}

	/**
	 * 사용자 로그인 처리
	 * 
	 * @param loginRequest 로그인 요청 DTO (username, password)
	 * @return 로그인 성공 시 User 모델 객체
	 * @throws SQLException       DB 오류 발생 시
	 * @throws UserLoginException 로그인 실패 (자격 증명 불일치, 계정 비활성 등) 시
	 */
	public User login(LoginRequest loginRequest) throws SQLException, UserLoginException {
		// 1. 사용자 존재 여부 및 비밀번호 검증
		User user = userDao.findByUsername(loginRequest.getUsername());
		if (user == null || !passwordEncoder.matches(loginRequest.getPassword(), user.getPassword())) {
			throw new UserLoginException("INVALID_CREDENTIALS", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}

		// 2. 사용자 계정 상태 확인
		if (!"active".equals(user.getStatus())) {
			String errorMessage = "비활성화되거나 탈퇴한 계정입니다. 관리자에게 문의하세요.";
			if ("withdrawn".equals(user.getStatus())) {
				errorMessage = "탈퇴한 계정입니다.";
			} else if ("inactive".equals(user.getStatus())) {
				errorMessage = "비활성화된 계정입니다.";
			}
			throw new UserLoginException("ACCOUNT_INACTIVE", errorMessage);
		}

		// 3. 마지막 로그인 시간 업데이트
		userDao.updateLastLoginDate(user.getUserId());

		return user;
	}

	/**
	 * 새로운 사용자 회원가입 처리
	 * 
	 * @param registrationRequest 회원가입 요청 DTO
	 * @return 회원가입 성공 시 생성된 User 모델 객체 (user_id 포함)
	 * @throws SQLException              DB 오류 발생 시
	 * @throws UserRegistrationException 유효성 검증 실패 (중복, 형식 불일치 등) 시
	 */
	public User registerUser(UserRegistrationRequest registrationRequest)
			throws SQLException, UserRegistrationException {
		// 1. DTO 필드 유효성 검증
		if (registrationRequest.getUsername() == null || registrationRequest.getUsername().trim().isEmpty()
				|| registrationRequest.getPassword() == null || registrationRequest.getPassword().trim().isEmpty()
				|| registrationRequest.getNickname() == null || registrationRequest.getNickname().trim().isEmpty()
				|| registrationRequest.getEmail() == null || registrationRequest.getEmail().trim().isEmpty()) {
			throw new UserRegistrationException("INVALID_INPUT", "필수 정보(사용자 이름, 비밀번호, 닉네임, 이메일)가 누락되었습니다.");
		}

		// 2. 비밀번호 정책 검증
		if (registrationRequest.getPassword().length() < 8
				|| !registrationRequest.getPassword().matches(".*[!@#$%^&*()].*")) {
			throw new UserRegistrationException("INVALID_PASSWORD", "비밀번호는 최소 8자 이상이어야 하며 특수문자를 포함해야 합니다.");
		}

		// 3. 이메일 형식 검증
		if (!registrationRequest.getEmail().matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
			throw new UserRegistrationException("INVALID_EMAIL", "유효하지 않은 이메일 형식입니다.");
		}

		// 4. MBTI 유효성 검증 (선택 사항이므로 null이거나 비어있으면 건너뛰고, 값이 있으면 검증)
		String mbti = registrationRequest.getMbti();
		if (mbti != null && !mbti.trim().isEmpty()) {
			String[] validMbti = { "ISTJ", "ISFJ", "INFJ", "INTJ", "ISTP", "ISFP", "INFP", "INTP", "ESTP", "ESFP",
					"ENFP", "ENTP", "ESTJ", "ESFJ", "ENFJ", "ENTJ" };
			boolean isValidMbti = false;
			for (String valid : validMbti) {
				if (valid.equalsIgnoreCase(mbti)) {
					isValidMbti = true;
					break;
				}
			}
			if (!isValidMbti) {
				throw new UserRegistrationException("INVALID_MBTI", "유효하지 않은 MBTI 유형입니다.");
			}
		}

		// 5. 중복 확인
		if (userDao.isUsernameTaken(registrationRequest.getUsername())) {
			throw new UserRegistrationException("DUPLICATE_USERNAME", "이미 사용 중인 사용자 이름입니다.");
		}
		if (userDao.isNicknameTaken(registrationRequest.getNickname())) {
			throw new UserRegistrationException("DUPLICATE_NICKNAME", "이미 사용 중인 닉네임입니다.");
		}
		if (userDao.isEmailTaken(registrationRequest.getEmail())) {
			throw new UserRegistrationException("DUPLICATE_EMAIL", "이미 사용 중인 이메일입니다.");
		}

		// 6. 비밀번호 해싱
		String hashedPassword = passwordEncoder.encode(registrationRequest.getPassword());

		// 7. User 모델 객체 생성
		User newUser = new User();
		newUser.setUsername(registrationRequest.getUsername());
		newUser.setPassword(hashedPassword);
		newUser.setNickname(registrationRequest.getNickname());
		newUser.setEmail(registrationRequest.getEmail());
		newUser.setGender(registrationRequest.getGender());
		newUser.setMbti(registrationRequest.getMbti());

		User createdUser = userDao.createUser(newUser);
		if (createdUser == null) {
			throw new UserRegistrationException("REGISTRATION_FAILED", "사용자 등록에 실패했습니다. 관리자에게 문의하세요.");
		}
		return createdUser;
	}

	/**
	 * 사용자 프로필 정보 조회
	 * 
	 * @param userId 조회할 사용자 ID
	 * @return User 모델 객체
	 * @throws SQLException         DB 오류 발생 시
	 * @throws UserProfileException 사용자 정보를 찾을 수 없거나 비활성 계정일 경우
	 */
	public User getUserProfile(int userId) throws SQLException, UserProfileException {
		User user = userDao.findByUserId(userId);
		if (user == null) {
			throw new UserProfileException("USER_NOT_FOUND", "사용자 정보를 찾을 수 없습니다.");
		}
		if (!"active".equals(user.getStatus())) {
			throw new UserProfileException("ACCOUNT_INACTIVE", "비활성화되거나 탈퇴한 계정입니다.");
		}
		return user;
	}

	/**
	 * 사용자 비밀번호 확인 (마이페이지에서 특정 작업 전 비밀번호 재확인용)
	 * 
	 * @param userId          현재 로그인된 사용자 ID
	 * @param enteredPassword 사용자가 입력한 평문 비밀번호
	 * @return 비밀번호가 일치하면 true
	 * @throws SQLException         DB 오류 발생 시
	 * @throws UserProfileException 비밀번호 불일치 시
	 */
	public boolean verifyPassword(int userId, String enteredPassword) throws SQLException, UserProfileException {
		User user = userDao.findByUserId(userId);
		if (user == null) {
			throw new UserProfileException("USER_NOT_FOUND", "사용자 정보를 찾을 수 없습니다.");
		}

		// 입력된 비밀번호와 DB에 저장된 해싱된 비밀번호 비교
		if (!passwordEncoder.matches(enteredPassword, user.getPassword())) {
			throw new UserProfileException("PASSWORD_MISMATCH", "비밀번호가 일치하지 않습니다.");
		}
		return true; // 비밀번호 일치
	}

	/**
	 * 사용자 프로필 정보 업데이트 (닉네임, 이메일, 성별, MBTI)
	 * 
	 * @param userId        업데이트할 사용자 ID
	 * @param updateRequest 업데이트 요청 DTO
	 * @return 성공 시 true
	 * @throws SQLException         DB 오류 발생 시
	 * @throws UserProfileException 유효성 검증 실패 (중복 등) 시
	 */
	public boolean updateUserProfile(int userId, UserProfileUpdateRequest updateRequest)
			throws SQLException, UserProfileException {
		// 1. DTO 필드 유효성 검증
		if (updateRequest.getNickname() == null || updateRequest.getNickname().trim().isEmpty()
				|| updateRequest.getEmail() == null || updateRequest.getEmail().trim().isEmpty()) {
			throw new UserProfileException("INVALID_INPUT", "닉네임과 이메일은 필수 입력값입니다.");
		}
		if (!updateRequest.getEmail().matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
			throw new UserProfileException("INVALID_EMAIL", "유효하지 않은 이메일 형식입니다.");
		}
		String mbti = updateRequest.getMbti();
		if (mbti != null && !mbti.trim().isEmpty()) {
			String[] validMbti = { "ISTJ", "ISFJ", "INFJ", "INTJ", "ISTP", "ISFP", "INFP", "INTP", "ESTP", "ESFP",
					"ENFP", "ENTP", "ESTJ", "ESFJ", "ENFJ", "ENTJ" };
			boolean isValidMbti = false;
			for (String valid : validMbti) {
				if (valid.equalsIgnoreCase(mbti)) {
					isValidMbti = true;
					break;
				}
			}
			if (!isValidMbti) {
				throw new UserProfileException("INVALID_MBTI", "유효하지 않은 MBTI 유형입니다.");
			}
		}

		// 2. 닉네임 및 이메일 중복 확인 (본인 제외)
		User currentUser = userDao.findByUserId(userId);
		if (currentUser == null) {
			throw new UserProfileException("USER_NOT_FOUND", "현재 사용자 정보를 찾을 수 없습니다.");
		}

		if (!currentUser.getNickname().equals(updateRequest.getNickname())
				&& userDao.isNicknameTaken(updateRequest.getNickname())) {
			throw new UserProfileException("DUPLICATE_NICKNAME", "이미 사용 중인 닉네임입니다.");
		}
		if (!currentUser.getEmail().equals(updateRequest.getEmail())
				&& userDao.isEmailTaken(updateRequest.getEmail())) {
			throw new UserProfileException("DUPLICATE_EMAIL", "이미 사용 중인 이메일입니다.");
		}

		// 3. DB 업데이트
		boolean success = userDao.updateUserProfile(userId, updateRequest);
		if (!success) {
			throw new UserProfileException("UPDATE_FAILED", "프로필 정보 업데이트에 실패했습니다.");
		}
		return true;
	}

	/**
	 * 사용자 비밀번호 변경
	 * 
	 * @param userId          비밀번호를 변경할 사용자 ID
	 * @param currentPassword 사용자가 입력한 현재 비밀번호 (평문)
	 * @param newPassword     사용자가 입력한 새 비밀번호 (평문)
	 * @return 성공 시 true
	 * @throws SQLException         DB 오류 발생 시
	 * @throws UserProfileException 비밀번호 불일치 또는 정책 위반 시
	 */
	// UserService.java
	public boolean changePassword(int userId, String newPassword) throws SQLException, UserProfileException {
		// 1. 새 비밀번호 정책 검증
		if (newPassword == null || newPassword.length() < 8 || !newPassword.matches(".*[!@#$%^&*()].*")) {
			throw new UserProfileException("INVALID_PASSWORD", "새 비밀번호는 최소 8자 이상이어야 하며 특수문자를 포함해야 합니다.");
		}

		// 2. 현재 사용자 정보 조회 (이 부분은 반드시 필요하지 않지만, 사용자 존재 여부 확인 차원에서 유지 가능)
		User user = userDao.findByUserId(userId);
		if (user == null) {
			throw new UserProfileException("USER_NOT_FOUND", "사용자 정보를 찾을 수 없습니다.");
		}

		// 3. 새 비밀번호 해싱
		String hashedPassword = passwordEncoder.encode(newPassword);

		// 4. DB 업데이트
		boolean success = userDao.updatePassword(userId, hashedPassword);

		if (!success) {
			throw new UserProfileException("PASSWORD_CHANGE_FAILED", "비밀번호 변경에 실패했습니다.");
		}
		return true;
	}

	/**
	 * 회원 탈퇴 (사용자 상태를 'withdrawn'으로 변경)
	 * 
	 * @param userId 탈퇴할 사용자 ID
	 * @return 성공 시 true
	 * @throws SQLException         DB 오류 발생 시
	 * @throws UserProfileException 탈퇴 처리 실패 시
	 */
	public boolean withdrawUser(int userId) throws SQLException, UserProfileException {
		boolean success = userDao.updateUserStatus(userId, "withdrawn");
		if (!success) {
			throw new UserProfileException("WITHDRAW_FAILED", "회원 탈퇴 처리 중 오류가 발생했습니다.");
		}
		return true;
	}
}