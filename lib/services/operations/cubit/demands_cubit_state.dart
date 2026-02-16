
import 'package:ashghal/services/operations/data/demands_model.dart';
import 'package:flutter/cupertino.dart';

@immutable


sealed class DemandsState {}

final class DemandsInitial extends DemandsState {
}

final class DemandsLoading extends DemandsState {}

final class DemandsSuccess extends DemandsState {
  final List<DemandsModel> demandsList;
  DemandsSuccess(this.demandsList);
}

final class DemandsError extends DemandsState {
  final String message;
  DemandsError(this.message);
}
