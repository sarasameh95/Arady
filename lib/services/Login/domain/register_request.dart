import 'package:ashghal/services/Login/data/user_register_model.dart';

class RegisterRequest {
  final String username;
  final String password;
  final String fullName;
  final int natId;
  final String mobileNo;
  final String whatsNo;
  final String email;

  RegisterRequest({
    required this.username,
    required this.password,
  required this.fullName,
  required this.natId,
  required this.mobileNo,
  required this.whatsNo,
  required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "natId": natId,
      "mobileNo": mobileNo,
      "whatsNo": whatsNo,
      "password": password,
      "username": username,
      "email": email,
    };
  }
}

class RegisterResponse {
  final UserRegisterModel userRegisterModel;
  RegisterResponse({required this.userRegisterModel});

  factory RegisterResponse.fromMap(Map<String, dynamic> json) {
    return RegisterResponse(
      userRegisterModel: UserRegisterModel.fromMap(json),
    );
  }
}
