
import 'package:game_haven/features/home/data/models/game_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {} // هنا الـ Shimmer هيشتغل

class HomeSuccess extends HomeState {
  final List<GameModel> games;
  HomeSuccess(this.games);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}