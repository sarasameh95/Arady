import 'package:equatable/equatable.dart';

class Demand extends Equatable {

  final String demandName;
  final String demandDate;
  final String address;
  final double id;
  final double tel;
  final String email;
  final double whatsNumber;
  final String areaName;
  final String demandTypeName;
  final String marafeqName;
  final String statusName;
  final double areaId;
  final double demandTypeId;
  final double marafeqId;
  final double statusId;

  const Demand(
      {required this.demandName,
        required this.demandDate,
        required this.address,
        required this.id,
        required this.tel,
        required this.email,
        required this.whatsNumber,
        required this.areaName,
        required this.demandTypeName,
        required this.marafeqName,
        required this.statusName,
        required this.areaId,
        required this.demandTypeId,
        required this.marafeqId,
        required this.statusId,


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
