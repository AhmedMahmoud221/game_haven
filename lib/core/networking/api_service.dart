import 'package:dio/dio.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart'; // ده كان ناقص عندك

@RestApi(baseUrl: "http://10.0.2.2:3000/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("all-games")
  Future<List<GameModel>> getAllGames();
}