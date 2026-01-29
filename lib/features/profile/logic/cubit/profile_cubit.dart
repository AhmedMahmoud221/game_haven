import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_haven/core/networking/api_result.dart';
import 'package:game_haven/features/profile/data/repos/profile_repository.dart';
import 'package:game_haven/features/profile/logic/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileCubit(this._profileRepository) : super(const ProfileState.initial());

  void getProfileData() async { 
    emit(const ProfileState.loading());
    final response = await _profileRepository.getProfileData();

    response.when(
      success: (userProfileResponse) {
        emit(ProfileState.success(userProfileResponse));
      },
      failure: (errorHandler) {
        emit(ProfileState.error(error: errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }
}