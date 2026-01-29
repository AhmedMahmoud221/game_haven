import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              // profile header
              verticalSpace(30),
              const ProfileHeader(),
              verticalSpace(30),

              // profile stats
              const ProfileStats(),
              verticalSpace(40),

              // profile menu items
              const ProfileMenuItems(),
              verticalSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}