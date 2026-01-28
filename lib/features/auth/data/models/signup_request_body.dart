import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable(createFactory: false)
class SignupRequestBody {
  final String name;
  final String email;
  final String username;
  final String password;
  final String passwordConfirm;

  SignupRequestBody({required this.name, required this.email, required this.username, required this.password, required this.passwordConfirm});
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}