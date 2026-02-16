import 'package:ashghal/core/dio_service.dart';
import 'package:ashghal/core/token_storage.dart';
import 'package:ashghal/services/Login/domain/register_request.dart';
import 'package:ashghal/services/Login/cubit/user_register_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final AuthService authService;
  RegisterCubit(this.authService) : super(RegisterInitial());

  Future<void> register({
    required String username,
    required String fullName,
    required int natId,
    required String mobileNo,
    required String whatsNo,
    required String email,
    required String password,
  }) async {
    if (username.isEmpty || password.isEmpty || fullName.isEmpty || natId.isNaN || mobileNo.isEmpty || whatsNo.isEmpty || email.isEmpty) {
      emit(RegisterFailure('من فضلك ادخل الحقول المطلوبة'));
      return;
    }
    emit(RegisterLoading());
    try {

      final response = await authService.register(
        RegisterRequest(username: username, password: password, fullName: fullName, natId: natId, mobileNo: mobileNo, whatsNo: whatsNo, email: email),
      );
      print('success');
      emit(RegisterSuccess(response.userRegisterModel.message));
    } on DioException catch (e) {
      var message =
          e.response?.data['message'] ?? 'خطأ, تأكد من صحة البيانات ';

      print(message);
      emit(RegisterFailure(message));
    } catch (e) {
      String fullMessage = e.toString();

      String cleanMessage = fullMessage.split(':').last.trim();

      print(cleanMessage);
// Output: Email already exists

      print('${e}');
      emit(RegisterFailure(cleanMessage));
    }
  }
}

