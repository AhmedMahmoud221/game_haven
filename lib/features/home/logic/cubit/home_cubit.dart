import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_haven/features/home/data/repos/home_repo.dart';
import 'package:game_haven/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInitial());

  void emitGetGamesStates() async {
    emit(HomeLoading());
    try {
      final response = await _homeRepo.getAllGames();
      emit(HomeSuccess(response));
    } catch (error) {
      emit(HomeError(error.toString()));
    }
  }
}