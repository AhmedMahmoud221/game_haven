import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/widgets/games_shimmer_loading.dart';
import 'package:game_haven/features/home/logic/cubit/home_cubit.dart';
import 'package:game_haven/features/home/logic/cubit/home_state.dart';
import 'package:game_haven/features/store/widgets/brand_new_game_item.dart';
import 'package:game_haven/features/store/widgets/store_section.dart';
import 'package:game_haven/features/store/widgets/store_top_chips.dart';
import 'package:game_haven/features/store/widgets/upcoming_game_item.dart';


class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().emitGetGamesStates();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return RefreshIndicator(
              color: ColorsManager.mainBackground,
              onRefresh: () async {
                context.read<HomeCubit>().emitGetGamesStates();
              },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // 1. (Latest, Curated, etc.)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      child: const StoreTopChips(),
                    ),
                  ),
                  if (state is HomeSuccess)
                    SliverToBoxAdapter(
                      child: StoreSection(
                        title: 'Brand new adventures',
                        onSeeAll: () {},
                        itemHeight: 220.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 20.w), 
                          itemCount: state.games.length,
                          itemBuilder: (context, index) {
                            return BrandNewGameItem(gameModel: state.games[index]);
                          },
                        ),
                      ),
                    )
                  else if (state is HomeLoading)
                    const SliverToBoxAdapter(child: GamesShimmerLoading()),

                  // 3.  Reserve upcoming
                  if (state is HomeSuccess)
                  SliverToBoxAdapter(
                    child: StoreSection(
                      title: 'Reserve upcoming',
                      onSeeAll: () {},
                      itemHeight: 260.h, // اتأكد إن الارتفاع ده كافي للـ Column الجديد
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        itemCount: state.games.length,
                        itemBuilder: (context, index) {
                          // بنمرر الموديل هنا برضه
                          return UpcomingGameItem(gameModel: state.games[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
