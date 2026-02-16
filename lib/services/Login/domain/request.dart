import 'package:ashghal/services/Login/data/user_model.dart';

class LoginRequest {
  final String username;
  final String password;

  LoginRequest({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}

class LoginResponse {
  final String token;
  final UserModel userData;

  LoginResponse({required this.token, required this.userData});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    print('from json${json['token']}');
    return LoginResponse(
      token: json['token'],
      userData: UserModel.fromMap(json['user']),
    );
  }
}
