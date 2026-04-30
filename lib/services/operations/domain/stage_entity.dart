import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// class StageStatus {
//   String status;
//   Icon icon;
// }
enum StageStatus { completed, current, upcoming }
List<IconData>  stageIcons =[ Icons.assignment_turned_in, Icons.people,
  Icons.verified, Icons.build ,Icons.flag];

class Stage extends Equatable  {
  final int? historyId;
  final int demandId;
  final String newStatus;
  final String? oldStatus;
  final DateTime? changedAt;
  final String? changedBy;
  final StageStatus? status;
  final IconData? stageIcon ;


  const Stage({
     this.historyId,
    required this.demandId,
     required this.newStatus,
     this.oldStatus,
     this.changedAt,
     this.changedBy,
     this.status,
     this.stageIcon,

  });

  @override
  List<Object?> get props => [
    historyId,
    demandId,
    newStatus,
    oldStatus,
    changedAt,
    changedBy,
    status,
    stageIcon,


  ];
}