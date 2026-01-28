import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_haven/core/helpers/shared_pref_helper.dart';
import 'package:game_haven/features/auth/data/models/login_request_body.dart';
import 'package:game_haven/features/auth/data/repos/login_repo.dart';
import 'package:game_haven/features/auth/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    try {
      final response = await _loginRepo.login(
        LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      
      // حفظ التوكن أول ما يرجع من السيرفر
      if (response.token != null) {
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, response.token!);
      }
      
      emit(LoginState.success(response));
    } catch (error) {
      emit(LoginState.error(error: error.toString()));
    }
  }

  Future<void> logout() async {
    await SharedPrefHelper.deleteSecuredString(SharedPrefKeys.userToken);
    
    emit(const LoginState.initial());
  }
}