import 'package:ashghal/services/Login/domain/user_entity.dart';
import 'package:http/http.dart';

class UserModel extends User {
  const UserModel(
      {required super.fullName,
        required super.userName,
        required super.password,
        required super.natId,
        required super.mobileNo,
        required super.whatsNo,
        required super.email,
        });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    try{ return UserModel(
        fullName: json['fullName'],
        userName: json['username'],
        password: json['password'],
        natId: json['natId'],
        mobileNo: json['mobileNo'],
        whatsNo: json['whatsNo'],
        email: json['email'],
      );
    }
    catch(e){
      //print(e);
      throw ClientException('ww');
    }
  }
}
