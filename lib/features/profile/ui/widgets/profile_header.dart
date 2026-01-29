import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/profile/data/model/user_profile_response.dart';

class ProfileHeader extends StatelessWidget {
  final User? user;
  const ProfileHeader({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundImage: const AssetImage('assets/images/login_logo.png'),
            ),
            _buildEditIcon(),
          ],
        ),
        verticalSpace(16),
        Text(user?.name ?? 'Unknown User', style: TextStyles.font26WhiteSemiBold),
        Text('@${user?.username ?? 'username'}', style: TextStyles.font14GreyRegular),
      ],
    );
  }

  Widget _buildEditIcon() {
    return CircleAvatar(
      radius: 14.r,
      backgroundColor: ColorsManager.mainPurple,
      child: Icon(Icons.edit, color: Colors.white, size: 18.sp),
    );
  }
}