// import 'package:dio/dio.dart';
import 'package:game_haven/core/networking/api_service.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<List<GameModel>> getAllGames() async {
    try {
      final response = await _apiService.getAllGames();
      // بنرجع الـ List اللي جوه الـ data اللي جوه الـ response
      return response.data?.games ?? []; 
    } catch (e) {
      throw Exception("Failed to load games: $e");
    }
  }
}