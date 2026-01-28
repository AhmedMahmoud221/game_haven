import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';

class GameDetailsScreen extends StatefulWidget {
  final GameModel? gameModel;
  const GameDetailsScreen({super.key, this.gameModel});

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
                              widget.gameModel?.name ?? 'Unknown Game',
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
                      Text(
                        'Developed by ${widget.gameModel?.author ?? "Unknown"}', 
                        style: TextStyles.font14GreyRegular
                      ),
                      verticalSpace(12),

                      // (Info Chips)
                      SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildInfoChip(Icons.category, widget.gameModel?.category ?? 'Action'),
                          horizontalSpace(16),
                          _buildInfoChip(Icons.star, "${widget.gameModel?.ratingsAverage ?? 0}"),
                          horizontalSpace(16),
                          _buildInfoChip(Icons.language, widget.gameModel?.language ?? 'English'),
                        ],
                      ),
                    ),
                      verticalSpace(20),
                      
                      // (rated)
                      Row(
                        children: [
                          Icon(Icons.security, color: Colors.grey, size: 20.sp),
                          horizontalSpace(8),
                          Text('Rated T - Mild Violence', style: TextStyles.font14GreyRegular),
                        ],
                      ),
                      verticalSpace(30),
                      
                      // (description)
                      Text('Description', style: TextStyles.font18WhiteMedium),
                      verticalSpace(12),
                      Text(
                        widget.gameModel?.description ?? 'No description available.',
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
                              child: Text(
                                'Buy now - \$${widget.gameModel?.price?.toStringAsFixed(2) ?? "0.00"}', 
                                style: TextStyles.font16WhiteSemiBold
                              ),
                            ),
                          ),
                          horizontalSpace(16),

                          // (share)
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



  // Helper method لتنسيق الشكل
  Widget _buildInfoChip(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: ColorsManager.mainPurple, size: 18.sp),
        horizontalSpace(4),
        Text(label, style: TextStyles.font14GreyRegular),
      ],
    );
  }
}