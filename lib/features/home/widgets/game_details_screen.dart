import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';

class GameDetailsScreen extends StatefulWidget {
  const GameDetailsScreen({super.key});

  @override
  State<GameDetailsScreen> createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding1.jpg', 
            width: double.infinity,
            height: 450.h,
            fit: BoxFit.cover,
          ),

          Container(
            height: 460.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  ColorsManager.mainBackground.withValues(alpha: 0.5),
                  ColorsManager.mainBackground,
                ],
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(400),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // (name & favorite)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Galactic Odyssey:\nInfinite Horizon',
                              style: TextStyles.font26WhiteSemiBold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() => isFavorite = !isFavorite);
                            },
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.white,
                              size: 30.sp,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(12),
                      
                      // (rated)
                      Row(
                        children: [
                          Icon(Icons.security, color: Colors.grey, size: 20.sp),
                          horizontalSpace(8),
                          Text('Rated T - Mild Violence', style: TextStyles.font14GreyRegular),
                        ],
                      ),
                      
                      verticalSpace(30),
                      Text('Description', style: TextStyles.font18WhiteMedium),
                      verticalSpace(12),
                      Text(
                        'Embark on an epic journey through the stars. Customize your fleet, forge alliances, and discover uncharted worlds in this open-universe adventure.',
                        style: TextStyles.font14GreyRegular.copyWith(height: 1.5),
                      ),
                      
                      verticalSpace(40),
                      // (pay & share)
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.mainPurple,
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                              ),
                              onPressed: () {},
                              child: Text('Buy now', style: TextStyles.font16WhiteSemiBold),
                            ),
                          ),
                          horizontalSpace(16),
                          Container(
                            padding: EdgeInsets.all(12.r),
                            decoration: BoxDecoration(
                              color: ColorsManager.cardGrey,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.share, color: Colors.white, size: 24.sp),
                          ),
                        ],
                      ),
                      verticalSpace(100),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 4.(Back Button)
          Positioned(
            top: 50.h,
            left: 20.w,
            child: CircleAvatar(
              backgroundColor: Colors.black.withValues(alpha: 0.5),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}