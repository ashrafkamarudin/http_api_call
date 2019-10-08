// class response json
class ApiResponse {
  final String status;
  final String message;

  ApiResponse({this.status, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
    );
  }

  getStatus() {
    return this.status;
  }
}