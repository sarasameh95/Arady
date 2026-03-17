import 'package:ashghal/core/dio_service.dart';
import 'package:ashghal/core/token_storage.dart';
import 'package:ashghal/services/Login/cubit/user_cubit_state.dart';
import 'package:ashghal/services/Login/domain/request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;
  final TokenStorage tokenStorage;
  LoginCubit(this.authService, this.tokenStorage) : super(LoginInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      emit(LoginFailure('اسم المستخدم و الرقم السرى مطلوبان'));
      return;
    }

    emit(LoginLoading());

    try {

      final response = await authService.login(
        LoginRequest(username: username, password: password),
      );
      print('success');
      await tokenStorage.saveToken(response.token);
      emit(LoginSuccess(response.token, response.userData));
    } on DioException catch (e) {
      var message = //'خطأ, تأكد من صحة اسم المستخدم والرقم السرى'
          e.response?.data['message'] ?? ' حدث خطأ اثناء الاتصال بالسيرفير حاول مرة اخرى';

      // if(message=='Invalid username'){
      //   message= 'خطأ, تأكد من صحة اسم المستخدم والرقم السرى';
      // }
      print(message);
      emit(LoginFailure(message));
    } catch (e) {
      print('failed $e');
      emit(LoginFailure('حدث خطأ ما تاكد من اتصالك بالشبكة'));
    }
  }
}

