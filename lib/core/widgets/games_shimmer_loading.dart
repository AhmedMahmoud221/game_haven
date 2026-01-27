import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:shimmer/shimmer.dart';

class GamesShimmerLoading extends StatelessWidget {
  const GamesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.mainGrey.withValues(alpha: 0.1),
      highlightColor: ColorsManager.mainGrey.withValues(alpha: 0.2),
      child: Column(
        children: List.generate(5, (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              Container(width: 80.w, height: 80.h, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12))),
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 150.w, height: 15.h, color: Colors.white),
                  verticalSpace(8),
                  Container(width: 100.w, height: 12.h, color: Colors.white),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}