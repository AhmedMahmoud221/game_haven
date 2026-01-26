import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';

class GameLibraryCard extends StatelessWidget {
  const GameLibraryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/onboarding1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: ColorsManager.mainPurple,
                  child: Icon(Icons.play_arrow, color: Colors.white, size: 20.sp),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(8),
        Text(
          'God of War',
          style: TextStyles.font14GreyRegular,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '24 Hours played',
          style: TextStyles.font13GreyRegular,
        ),
      ],
    );
  }
}