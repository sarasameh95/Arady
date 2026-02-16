import 'package:ashghal/core/dio_service.dart';
import 'package:ashghal/core/token_storage.dart';
import 'package:ashghal/services/operations/cubit/demands_cubit_state.dart';
import 'package:ashghal/services/operations/data/demands_model.dart';
import 'package:bloc/bloc.dart';


class DemandsCubit extends Cubit<DemandsState> {
  DemandsCubit() : super(DemandsInitial());

  Future<void> getDemandsFromApi() async {

    emit(DemandsLoading());

    try {
      final List<DemandsModel> demands =
      await DemandService(TokenStorage()).getUserDemands();

      // sort by latest
      demands.sort(
            (a, b) => DateTime.parse(b.demandDate)
            .compareTo(DateTime.parse(a.demandDate)),
      );

      emit(DemandsSuccess(demands));
    } catch (e) {
      emit(DemandsError(e.toString()));
    }
  }
}

