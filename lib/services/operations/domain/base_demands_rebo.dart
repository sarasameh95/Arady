import 'package:ashghal/core/failures.dart';
import 'dart:async';
import 'package:dartz/dartz.dart';
import '../domain/demands_entity.dart';



abstract class BaseDemandsRepository {
  Future <Either<Failure,List<Demand>>> getAllDemands();
}