import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String fullName;
  final String userName;
//  final String password;
  //final double natId;
  final int id;
  final String mobileNo;
  //final String whatsNo;
  final String email;

  const User(
      {required this.fullName,
        required this.userName,
      //  required this.password,
      //  required this.natId,
        required this.mobileNo,
       // required this.whatsNo,
        required this.email, required this.id});

  @override
  List<Object?> get props => [
    fullName,
    userName,
  //  password,
   // natId,
    mobileNo,
   // whatsNo,
    email,
    id
  ];
}
