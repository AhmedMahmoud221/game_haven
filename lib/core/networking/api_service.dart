import 'package:dio/dio.dart';
import 'package:game_haven/features/auth/data/models/login_request_body.dart';
import 'package:game_haven/features/auth/data/models/login_response.dart';
import 'package:game_haven/features/auth/data/models/signup_request_body.dart';
import 'package:game_haven/features/auth/data/models/signup_response.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:3000/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("api/v1/games")
  Future<GameResponse> getAllGames(); // خليه يرجع GameResponse

  @POST("api/v1/users/auth/login")
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody,);

  @POST("api/v1/users/auth/register")
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}