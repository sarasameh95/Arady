import 'package:ashghal/services/operations/domain/stage_entity.dart';
import 'package:http/http.dart';
class StageModel extends Stage {
   StageModel({
    super.historyId,
     required super.demandId,
     required super.newStatus,
    super.oldStatus,
    super.changedAt,
    super.changedBy,
    //super.status,

  }) ;

  factory StageModel.fromMap(Map<String, dynamic> json) {
    try{ return StageModel(

      historyId: json['historyId']as int?,
      demandId: json['demandId'],
      newStatus: json['newStatus'],
      oldStatus: json['oldStatus']as String?,
      changedAt: json['changedAt']as DateTime?,
      changedBy: json['changedBy']as String?,
      //status: json['status'],

    );
    }
    catch(e){
      print('from stages model $json');
      print('from stages model $e');
      throw ClientException('ww');
    }
  }

}