class LoginResponse {
  bool success;
  String message;
  String data; 

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? "",
      data: json['data'] ?? "",
    );
  }
}