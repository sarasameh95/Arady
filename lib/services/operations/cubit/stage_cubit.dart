import 'package:ashghal/services/operations/domain/stage_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StagesCubit extends Cubit<List<Stage>> {
  StagesCubit() : super([]);

  void loadStages() async {
    emit(_mockStages()); // replace with API later
  }

  List<Stage> _mockStages() {
    return [
      Stage(
        newStatus: 'تم تقديم الطلب',
        // description: 'تم استلام طلبك بنجاح',
        changedAt: DateTime.now().subtract(const Duration(hours: 5)),
        status: StageStatus.completed,
        stageIcon: stageIcons[0],
        demandId: 325,
      ),
      Stage(
        newStatus: 'قيد المراجعة',
       // description: 'جاري مراجعة الطلب',
        changedAt: DateTime.now().subtract(const Duration(hours: 2)),
        status: StageStatus.completed,
        stageIcon: stageIcons[1],
        demandId: 325,
      ),
      Stage(
        newStatus: 'تمت الموافقة',
       // description: 'تمت الموافقة على الطلب',
        changedAt: DateTime.now(),
        status: StageStatus.current,
        stageIcon: stageIcons[2],
        demandId: 325
      ),
      Stage(
        newStatus: 'قيد التنفيذ',
       // description: 'سيتم تنفيذ الطلب قريباً',
        status: StageStatus.upcoming,
          stageIcon: stageIcons[3],
          demandId: 325
      ),
      Stage(
        newStatus: 'مكتمل',
        //description: 'تم الانتهاء من الطلب',
        status: StageStatus.upcoming,
        stageIcon: stageIcons[4],
        demandId: 325,
      ),
    ];
  }
}