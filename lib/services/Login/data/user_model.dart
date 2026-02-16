import 'package:ashghal/services/Login/domain/user_entity.dart';
import 'package:http/http.dart';

class UserModel extends User {
  const UserModel(
      {required super.fullName,
        required super.userName,
      //  required super.password,
      //  required super.natId,
        required super.mobileNo,
      //  required super.whatsNo,
        required super.email,
        required super.id
        });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    try{
      print('from model ${json['fullname']}');
      return UserModel(
        fullName: json['fullname'],
        userName: json['username'],
      //  password: json['password'],
       // natId: json['natId'],
        mobileNo: json['mobileNumber'],
       // whatsNo: json['whatsNo'],
        email: json['email'],
        id: json['id']
      );
    }
    catch(e){
      print(e);
      throw ClientException('ww');
    }
  }
}
