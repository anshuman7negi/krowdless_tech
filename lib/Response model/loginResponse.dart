class LoginResponse {
  final String? status;
  final String? message;
  final LoginData? data;

  LoginResponse({
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class LoginData {
  final int? userId;
  final String? token;
  final String? refreshToken;
  final String? username;
  final String? role;
  final bool? verified;

  LoginData({
    this.userId,
    this.token,
    this.refreshToken,
    this.username,
    this.role,
    this.verified,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      userId: json['userId'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      username: json['username'],
      role: json['role'],
      verified: json['verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'token': token,
      'refreshToken': refreshToken,
      'username': username,
      'role': role,
      'verified': verified,
    };
  }
}
