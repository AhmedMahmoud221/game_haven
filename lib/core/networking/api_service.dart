import 'package:dio/dio.dart';
import 'package:game_haven/features/auth/data/models/login_request_body.dart';
import 'package:game_haven/features/auth/data/models/login_response.dart';
import 'package:game_haven/features/auth/data/models/signup_request_body.dart';
import 'package:game_haven/features/auth/data/models/signup_response.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';
import 'package:game_haven/features/profile/data/model/user_profile_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://neil-regional-doomfully.ngrok-free.dev/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("api/v1/games")
  Future<GameResponse> getAllGames();

  @POST("api/v1/users/auth/login")
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody,);

  @POST("api/v1/users/auth/register")
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);

  @GET("api/v1/users/get-me") 
  Future<UserProfileResponse> getProfileData();
}