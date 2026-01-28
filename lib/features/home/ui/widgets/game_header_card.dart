import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';

class GameHeaderCard extends StatelessWidget {
  final GameModel? gameModel;
  const GameHeaderCard({super.key, this.gameModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
            Routes.gameDetailsScreen,
            arguments: gameModel,
          );
      },
      child: Container(
        width: 300.w,
        margin: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          image: const DecorationImage(
            image: AssetImage('assets/images/onboarding3.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                ),
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(gameModel?.name ?? 'Unknown Game', style: TextStyles.font16WhiteSemiBold),
                  Text(gameModel?.category ?? 'Unknown Genre', style: TextStyles.font14GreyRegular),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}