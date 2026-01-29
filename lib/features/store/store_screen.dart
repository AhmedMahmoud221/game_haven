import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/features/store/widgets/brand_new_game_item.dart';
import 'package:game_haven/features/store/widgets/store_section.dart';
import 'package:game_haven/features/store/widgets/store_top_chips.dart';
import 'package:game_haven/features/store/widgets/upcoming_game_item.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 1. (Latest, Curated, etc.)
            SliverToBoxAdapter(child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: const StoreTopChips(),
            )),

            // 2.  Brand new adventures
            SliverToBoxAdapter(
              child: StoreSection(
                title: 'Brand new adventures',
                onSeeAll: () {},
                itemHeight: 220.h,
                child: const BrandNewGameItem(),
              ),
            ),

            // 3.  Reserve upcoming
            SliverToBoxAdapter(
              child: StoreSection(
                title: 'Reserve upcoming',
                onSeeAll: () {},
                itemHeight: 260.h, 
                child: const UpcomingGameItem(),
              ),
            ),
            
            // for scrolling
            SliverToBoxAdapter(child: verticalSpace(20)),
          ],
        ),
      ),
    );
  }
}