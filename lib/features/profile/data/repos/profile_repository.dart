import 'package:game_haven/core/networking/api_result.dart'; // ده اللي فيه ApiResult
import 'package:game_haven/core/networking/api_error_handler.dart';
import 'package:game_haven/core/networking/api_service.dart';
import 'package:game_haven/features/profile/data/model/user_profile_response.dart';

class ProfileRepository {
  final ApiService _apiService;

  ProfileRepository(this._apiService);

  Future<ApiResult<UserProfileResponse>> getProfileData() async {
    try {
      final response = await _apiService.getProfileData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}