import '../models/request_model.dart';

abstract class CheckCancellationStates {}

class CheckCancellatioInitial extends CheckCancellationStates {}

class CheckCancellatioLoading extends CheckCancellationStates {}

class CheckCancellatioSuccess extends CheckCancellationStates {
  final MyRequestItemsModel data;
  CheckCancellatioSuccess({required this.data});
}

class CheckCancellatioError extends CheckCancellationStates {
  final String error;
  CheckCancellatioError({required this.error});
}
