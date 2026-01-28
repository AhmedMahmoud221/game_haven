import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';
import 'package:game_haven/features/home/ui/widgets/popular_game_tile.dart';

class FavoritesScreen extends StatelessWidget {
  final GameModel? gameModel;
  const FavoritesScreen({super.key, this.gameModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      appBar: AppBar(
        backgroundColor: ColorsManager.mainBackground,
        title: Text('My Favorites', style: TextStyles.font18WhiteMedium),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: gameModel == null
          ? buildEmptyState() 
          : ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              itemCount: 1,
              itemBuilder: (context, index) {
                return const PopularGameTile();
              },
            ),
    );
  }

  // ويدجت يظهر لو مفيش ألعاب في المفضلة
  Widget buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80.sp, color: ColorsManager.secondaryGrey),
          SizedBox(height: 16.h),
          Text(
            'Your favorite list is empty!',
            style: TextStyles.font16WhiteSemiBold,
          ),
          SizedBox(height: 8.h),
          Text(
            'Start adding some games you love.',
            style: TextStyles.font14GreyRegular,
          ),
        ],
      ),
    );
  }
}