import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GamesShimmerLoadingLibrary extends StatelessWidget {
  const GamesShimmerLoadingLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[700]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // كارت الصورة
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          // مكان النص (اسم اللعبة)
          Container(
            height: 14.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 4.h),
          // مكان النص الفرعي
          Container(
            height: 12.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }
}