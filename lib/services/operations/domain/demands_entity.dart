import 'package:equatable/equatable.dart';

class Demand extends Equatable {

  final String? demandName;
  final String demandDate;
  final String? address;
  final int id;
  final int tel;
  final String? email;
  final int? whatsNumber;
  final String? areaName;
  final String? demandTypeName;
  final String? marafeqName;
  final String? statusName;
  final int? areaId;
  final int? demandTypeId;
  final int? marafeqId;
  final int? statusId;

  const Demand(
      { this.demandName,
        required this.demandDate,
         this.address,
        required this.id,
        required this.tel,
         this.email,
         this.whatsNumber,
         this.areaName,
         this.demandTypeName,
         this.marafeqName,
         this.statusName,
         this.areaId,
         this.demandTypeId,
         this.marafeqId,
         this.statusId,


      });

  @override
  List<Object?> get props => [
    demandName,
    demandDate,
    address,
    id,
    tel,
    email,
    whatsNumber,
    areaName,
    demandTypeName,
    marafeqName,
    statusName,
    areaId,
    demandTypeId,
    marafeqId,
    statusId,

  ];
}
