import 'package:bloc/bloc.dart';

import '../models/request_model.dart';
import '../repository/data_repo.dart';
import 'check_cancellation_state.dart';

class CheckCancellationCubit extends Cubit<CheckCancellationStates> {
  CheckCancellationCubit() : super(CheckCancellatioInitial());

  final MyDataRepository _repository = MyDataRepository();

  void postData({
    required int age,
    required var gender,
    String? educationalQualification,
    required int familySize,
    String? monthlyIncome,
    String? occupation,
    required String maritalStatus,
    required double latitude,
    required double longitude,
    required int pinCode,
    required String feedback,
  }) async {
    emit(CheckCancellatioLoading());
    try {
      final result = await _repository.postData(

        MyRequestItemsModel(
          age: age,
          gender: gender,
          educationalQualifications: educationalQualification,
          familySize: familySize,
          monthlyIncome: monthlyIncome,
          occupation: occupation,
          maritalStatus: maritalStatus,
          latitude: latitude,
          longitude: longitude,
          pincode: pinCode,
          feedback: feedback,
        ),
      );
      if (result != null) {
        emit(CheckCancellatioSuccess(data: result));
      } else {
        emit(CheckCancellatioError(error: 'Result is null'));
      }
    } on Exception catch (e) {
      emit(CheckCancellatioError(error: 'Error: $e'));
    }
  }
}
