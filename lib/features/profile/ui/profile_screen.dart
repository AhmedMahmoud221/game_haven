import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/profile/logic/cubit/profile_cubit.dart';
import 'package:game_haven/features/profile/logic/cubit/profile_state.dart';
import 'package:game_haven/features/profile/ui/widgets/profile_header.dart';
import 'package:game_haven/features/profile/ui/widgets/profile_menu_items.dart';
import 'package:game_haven/features/profile/ui/widgets/profile_stats.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator(color: ColorsManager.mainPurple)),
              success: (userResponse) => _buildProfileBody(context, userResponse.data?.user),
              error: (error) => Center(child: Text(error, style: TextStyles.font16WhiteSemiBold)),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileBody(BuildContext context, user) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          verticalSpace(30),
          ProfileHeader(user: user),
          verticalSpace(30),
          const ProfileStats(),
          verticalSpace(40),
          const ProfileMenuItems(),
        ],
      ),
    );
  }
}