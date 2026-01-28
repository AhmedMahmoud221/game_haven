import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_haven/features/auth/data/models/signup_response.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success(SignupResponse signupResponse) = Success; // حددنا النوع هنا
  const factory SignupState.error({required String error}) = Error;
}