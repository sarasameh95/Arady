
import 'package:ashghal/services/operations/data/demands_data_source.dart';
import 'package:ashghal/services/operations/domain/base_demands_rebo.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:dartz/dartz.dart';
import '../../../core/failures.dart';
import '../domain/demands_entity.dart';
import '../../../core/network_info.dart';
import '../../../core/utils/app_strings.dart';
/*

class DemandsRepository implements BaseDemandsRepository{

  final NetworkInfo networkInfo;
  final DemandsRemoteDataSource demandsRemoteDataSource;

  DemandsRepository({required this.networkInfo, required this.demandsRemoteDataSource});
  @override
  Future<Either<Failure,List<Demand>>> getAllDemands() async{
    if(await networkInfo.isConnected){
      try{
        List<Demand> result = await demandsRemoteDataSource.getDemands();
        return Right(result);
      }
      on ClientException{
        return left(ServerFailure(failureMessage:Error.server));
      }

      on TimeoutException {
        return left(TimeOutFailure(failureMessage: Error.timeOut));
      }
      catch(e){
        return left(ServerFailure(failureMessage:e.runtimeType.toString()));
      }
    }
    else{
      return left(NetworkFailure(failureMessage:Error.network));
    }
  }

}*/