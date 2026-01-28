import 'package:game_haven/core/networking/api_service.dart';
import 'package:game_haven/features/auth/data/models/login_request_body.dart';
import 'package:game_haven/features/auth/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<LoginResponse> login(LoginRequestBody loginRequestBody) async {
    return await _apiService.login(loginRequestBody);
  }
}