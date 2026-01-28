import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_haven/features/auth/data/models/login_response.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(LoginResponse loginResponse) = Success; // حددنا النوع هنا
  const factory LoginState.error({required String error}) = Error;
}