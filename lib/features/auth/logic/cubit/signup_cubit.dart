import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_haven/core/helpers/shared_pref_helper.dart';
import 'package:game_haven/features/auth/data/models/signup_request_body.dart';
import 'package:game_haven/features/auth/data/repos/signup_repo.dart';
import 'package:game_haven/features/auth/logic/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.loading());
    try {
      final response = await _signupRepo.signup(
        SignupRequestBody(
          name: nameController.text,
          email: emailController.text,
          username: usernameController.text,
          password: passwordController.text,
          passwordConfirm: passwordConfirmController.text
        ),
      );
      
      // حفظ التوكن أول ما يرجع من السيرفر
      if (response.token != null) {
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, response.token!);
      }
      
      emit(SignupState.success(response));
    } catch (error) {
      emit(SignupState.error(error: error.toString()));
    }
  }
}
