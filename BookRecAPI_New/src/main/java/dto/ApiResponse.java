package dto;

// 모든 API 응답의 공통 형식을 정의 (성공/실패 메시지, 데이터 등)
public class ApiResponse<T> { // T는 data 필드의 타입을 나타내는 제네릭
    public static final String STATUS_SUCCESS = "success";
    public static final String STATUS_ERROR = "error";

    private final String status;    // "success" 또는 "error"
    private final T data;          // 실제 응답 데이터 (성공 시)
    private final String message;   // 사용자에게 보여줄 메시지
    private final String code;      // 오류 코드 (오류 시)

    // private 생성자로 외부에서 직접 생성을 제한하고 팩토리 메서드 사용을 유도 (선택 사항)
    private ApiResponse(String status, T data, String message, String code) {
        this.status = status;
        this.data = data;
        this.message = message;
        this.code = code;
    }

    // 성공 응답 팩토리 메서드 (데이터와 메시지 포함)
    public static <T> ApiResponse<T> success(T data, String message) {
        return new ApiResponse<>(STATUS_SUCCESS, data, message, null);
    }

    // 성공 응답 팩토리 메서드 (데이터 없이 메시지만 포함)
    public static ApiResponse<Void> success(String message) {
        return new ApiResponse<>(STATUS_SUCCESS, null, message, null);
    }

    // 실패 응답 팩토리 메서드 (오류 코드와 메시지 포함)
    public static <T> ApiResponse<T> error(String code, String message) {
        return new ApiResponse<>(STATUS_ERROR, null, message, code);
    }

    // Getter 메서드
    public String getStatus() { return status; }
    public T getData() { return data; }
    public String getMessage() { return message; }
    public String getCode() { return code; }

    @Override
    public String toString() {
        return "ApiResponse{" +
               "status='" + status + '\'' +
               ", data=" + data +
               ", message='" + message + '\'' +
               ", code='" + code + '\'' +
               '}';
    }
}