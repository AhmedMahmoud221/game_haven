import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.mainPurple : ColorsManager.cardGrey,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isSelected ? ColorsManager.mainPurple : ColorsManager.secondaryGrey.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        title,
        style: TextStyles.font14GreyRegular.copyWith(
          color: isSelected ? Colors.white : ColorsManager.mainGrey,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}