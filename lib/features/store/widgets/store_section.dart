import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/theming/styles.dart';

class StoreSection extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  final Widget child;
  final double itemHeight;

  const StoreSection({super.key, required this.title, required this.onSeeAll, required this.child, required this.itemHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyles.font18WhiteMedium),
              GestureDetector(
                onTap: onSeeAll,
                child: Text('See all', style: TextStyles.font13GreyRegular),
              ),
            ],
          ),
        ),
        SizedBox(
          height: itemHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20.w),
            itemCount: 5,
            itemBuilder: (context, index) => child,
          ),
        ),
      ],
    );
  }
}