import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';

class UpcomingGameItem extends StatelessWidget {
  const UpcomingGameItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.gameDetailsScreen);
      },
      child: Container(
        width: 160.w,
        margin: EdgeInsets.only(right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    'assets/images/onboarding4.jpeg', 
                    height: 180.h,
                    width: 160.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'Pre-order now',
                      style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            Text(
              'Crimson Dusk',
              style: TextStyles.font16WhiteSemiBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(2),
            Text(
              '\$59.99',
              style: TextStyles.font13GreyRegular.copyWith(color: ColorsManager.mainGrey),
            ),
          ],
        ),
      ),
    );
  }
}