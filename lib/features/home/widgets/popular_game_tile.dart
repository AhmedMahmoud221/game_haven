import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';

class PopularGameTile extends StatelessWidget {
  final GameModel? gameModel;
  const PopularGameTile({super.key, this.gameModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.gameDetailsScreen);
        },
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: ColorsManager.cardGrey,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              // 1. small game photo
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/images/onboarding4.jpeg',
                  width: 70.w,
                  height: 70.h,
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpace(16),
              
              // 2. (details)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Elden Ring',
                      style: TextStyles.font16WhiteSemiBold,
                    ),
                    verticalSpace(4),
                    Text(
                      'Action • RPG',
                      style: TextStyles.font13GreyRegular,
                    ),
                  ],
                ),
              ),
              
              // 3. (rated & sallary)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      horizontalSpace(4),
                      Text('4.8', style: TextStyles.font14GreyRegular),
                    ],
                  ),
                  verticalSpace(8),
                  Text('\$59.99', style: TextStyles.font14PurpleSemiBold),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}