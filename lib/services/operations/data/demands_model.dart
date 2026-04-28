import 'package:ashghal/services/operations/domain/demands_entity.dart';
import 'package:http/http.dart';

class DemandsModel extends Demand {
  const DemandsModel(
      { super.demandName,
        required super.demandDate,
         super.address,
        required super.id,
        required super.tel,
         super.email,
         super.whatsNumber,
         super.areaName,
         super.demandTypeName,
         super.marafeqName,
         super.statusName,
         super.areaId,
         super.demandTypeId,
         super.marafeqId,
         super.statusId,

      });

  factory DemandsModel.fromMap(Map<String, dynamic> json) {
    try{ return DemandsModel(
        demandName: json['name'],//
        demandDate: json['demandDate'],//
        address: json['address'],//
        id: json['id'],//
        tel: json['tel'],//
        email: json['email']as String?,//
        whatsNumber: json['whatsNumber'],//
        areaName: json['areaName'],//
        demandTypeName: json['demandTypeName'],//
        marafeqName: json['marafeqName']as String?,//
        statusName: json['statusName'],//
        areaId: json['areaId'],//
        demandTypeId: json['demandTypeId'],//
        marafeqId: json['marafeqId']as int?,//
        statusId: json['statusId'],//

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
      print('from demands model $json');
      print('from demands model $e');
      throw ClientException('ww');
    }
  }
}
