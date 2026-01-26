import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';

class StoreTopChips extends StatefulWidget {
  const StoreTopChips({super.key});

  @override
  State<StoreTopChips> createState() => _StoreTopChipsState();
}

class _StoreTopChipsState extends State<StoreTopChips> {
  int selectedIndex = 0;
  final List<String> chipLabels = ['Latest', 'Curated collections', 'Exclusive offers'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        itemCount: chipLabels.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? ColorsManager.mainPurple : ColorsManager.cardGrey,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(
                  color: isSelected ? Colors.transparent : ColorsManager.secondaryGrey.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                chipLabels[index],
                style: isSelected ? TextStyles.font16WhiteSemiBold : TextStyles.font14GreyRegular,
              ),
            ),
          );
        },
      ),
    );
  }
}