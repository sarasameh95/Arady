import 'package:ashghal/services/operations/data/stage_model.dart';
import 'package:flutter/cupertino.dart';

abstract class StagesState {}

class StagesInitial extends StagesState {}

class StagesLoading extends StagesState {}

class StagesSuccess extends StagesState {
  final List<StageModel> stages;

  StagesSuccess(this.stages);
}

class StagesError extends StagesState {
  final String message;

  StagesError(this.message);
}