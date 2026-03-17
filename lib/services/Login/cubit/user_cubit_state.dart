import 'package:ashghal/services/Login/data/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;
  final UserModel userData;


  LoginSuccess(this.token, this.userData);
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}
