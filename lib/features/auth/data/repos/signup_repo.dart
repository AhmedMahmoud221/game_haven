import 'package:game_haven/core/networking/api_service.dart';
import 'package:game_haven/features/auth/data/models/signup_request_body.dart';
import 'package:game_haven/features/auth/data/models/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<SignupResponse> signup(SignupRequestBody signupRequestBody) async {
    return await _apiService.signup(signupRequestBody);
  }
}