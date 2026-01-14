import 'package:equatable/equatable.dart';


abstract class Failure extends Equatable{
  final String failureMessage;

  const Failure({required this.failureMessage});
  @override
  List<Object?> get props => [];
}
class ServerFailure extends Failure{
  const ServerFailure({required super.failureMessage});

}
class TimeOutFailure extends Failure{
  const TimeOutFailure({required super.failureMessage});

}
class NetworkFailure extends Failure{
  // NetworkFailure() : super(failureMessage: AppStrings.errors.network);

  const NetworkFailure({required super.failureMessage});

}
class CashFailure extends Failure{
  const CashFailure({required super.failureMessage});

}