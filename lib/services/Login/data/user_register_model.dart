import 'package:ashghal/services/Login/domain/user_entity.dart';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';

class UserRegister extends Equatable {
  final String userName;
  final String message;
  final int id;

  const UserRegister(
      {required this.message,
        required this.userName,
        required this.id});

  @override
  List<Object?> get props => [
    message,
    userName,
    id
  ];
}

class UserRegisterModel extends UserRegister {
  const UserRegisterModel(
      { required super.message,
        required super.userName,
        required super.id
        });

  factory UserRegisterModel.fromMap(Map<String, dynamic> json) {
    try{
      return UserRegisterModel(
        message: json['message'],
        userName: json['username'],
        id: json['userId']
      );
    }
    catch(e){
      print(e);
      throw ClientException('ww');
    }
  }
}
