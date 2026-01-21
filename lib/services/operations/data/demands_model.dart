import 'package:ashghal/services/operations/domain/demands_entity.dart';
import 'package:http/http.dart';

class DemandsModel extends Demand {
  const DemandsModel(
      {required super.demandName,
        required super.demandDate,
        required super.address,
        required super.id,
        required super.tel,
        required super.email,
        required super.whatsNumber,
        required super.areaName,
        required super.demandTypeName,
        required super.marafeqName,
        required super.statusName,
        required super.areaId,
        required super.demandTypeId,
        required super.marafeqId,
        required super.statusId,

      });

  factory DemandsModel.fromMap(Map<String, dynamic> json) {
    try{ return DemandsModel(
        demandName: json['name'],
        demandDate: json['demandDate'],
        address: json['address'],
        id: json['id'],
        tel: json['tel'],
        email: json['email'],
        whatsNumber: json['whatsNumber'],
        areaName: json['areaName'],
        demandTypeName: json['demandTypeName'],
        marafeqName: json['marafeqName'],
        statusName: json['statusName'],
        areaId: json['areaId'],
        demandTypeId: json['demandTypeId'],
        marafeqId: json['marafeqId'],
        statusId: json['statusId'],

      /*  "id": 0,
  "demandDate": "2025-12-25T09:14:50.544Z",
  "name": "string",
  "address": "string",
  "tel": 0,
  "email": "string",
  "whatsNumber": 0,
  "areaId": 0,
  "areaName": "string",
  "demandTypeId": 0,
  "demandTypeName": "string",
  "marafeqId": 0,
  "marafeqName": "string",
  "statusId": 0,
  "statusName": "string"*/
    );
    }
    catch(e){
      //print(e);
      print('from model $json');
      print('from model $e');
      throw ClientException('ww');
    }
  }
}
