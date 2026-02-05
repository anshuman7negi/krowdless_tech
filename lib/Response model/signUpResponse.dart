class SignUpResponse {
  final String status;
  final String message;
  final UserData data;

  SignUpResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String role;
  final bool verified;

  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.role,
    required this.verified,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? '',
      verified: json['verified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'role': role,
      'verified': verified,
    };
  }
}
