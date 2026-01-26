import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/home/widgets/category_item.dart';
import 'package:game_haven/features/home/widgets/game_header_card.dart';
import 'package:game_haven/features/home/widgets/game_search_delegate.dart';
import 'package:game_haven/features/home/widgets/popular_game_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // بنعرف متغير يشيل رقم العنصر المختار حالياً
  int selectedCategoryIndex = 0;

  final List<String> categories = [
    'Action', 'RPG', 'Mystery', 'Horror', 'Sports', 'Adventure',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 1.(Welcome Message)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, Player !', style: TextStyles.font18WhiteMedium),
                        Text('What are we playing today?', style: TextStyles.font14GreyRegular),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.white, size: 32),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: GameSearchDelegate(),
                            );
                          },
                        ),
                        horizontalSpace(12.w),
                        IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.white, size: 32),
                          onPressed: () {
                            context.pushNamed(Routes.favoritesScreen); 
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // 2.(categores)
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20.w),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: CategoryItem(
                            title: categories[index],
                            isSelected: selectedCategoryIndex == index,
                          ),
                        );
                      },
                    ),
                  ),
                  verticalSpace(24.h),
                ],
              ),
            ),

            // 2.(Horizontal Slider)
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text('Popular Picks', style: TextStyles.font26WhiteSemiBold),
                  ),
                  verticalSpace(16),
                  SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20.w),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const GameHeaderCard();
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 3.(Most Popular)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  children: [
                    Text('Most Popular', style: TextStyles.font18WhiteMedium),
                    Spacer(),
                    Text('See all', style: TextStyles.font13GreyRegular),
                  ],
                ),
              ),
            ),
            
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const PopularGameTile(),
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}