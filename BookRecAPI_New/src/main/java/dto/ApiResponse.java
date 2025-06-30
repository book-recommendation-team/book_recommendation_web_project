package dto;

//모든 API 응답의 공통 형식을 정의 (성공/실패 메시지, 데이터 등)
public class ApiResponse<T> { // T는 data 필드의 타입을 나타내는 제네릭
 private String status;  // "success" 또는 "error"
 private T data;         // 실제 응답 데이터 (성공 시)
 private String message; // 사용자에게 보여줄 메시지
 private String code;    // 오류 코드 (오류 시)

 // 성공 응답용 생성자
 public ApiResponse(String status, T data, String message) {
     this.status = status;
     this.data = data;
     this.message = message;
 }

 // 실패 응답용 생성자
 public ApiResponse(String status, String code, String message) {
     this.status = status;
     this.code = code;
     this.message = message;
 }

 // Getter 메서드 (Setter는 보통 필요 없음)
 public String getStatus() { return status; }
 public T getData() { return data; }
 public String getMessage() { return message; }
 public String getCode() { return code; }
}