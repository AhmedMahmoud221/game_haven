import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';

class BrandNewGameItem extends StatelessWidget {
  final GameModel? gameModel;
  const BrandNewGameItem({super.key, this.gameModel});

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
                  child: Image.asset('assets/images/onboarding1.jpg', height: 160.h, width: 160.w, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 8.h,
                  right: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(8.r)),
                    child: Text('Free trial', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            Text(gameModel?.name ?? 'Unknown Game', style: TextStyles.font16WhiteSemiBold, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}