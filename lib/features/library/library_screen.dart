import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/library/widgets/game_library_card.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsManager.mainBackground,
        appBar: AppBar(
          backgroundColor: ColorsManager.mainBackground,
          elevation: 0,
          title: Text('My Library', style: TextStyles.font18WhiteMedium.copyWith(fontSize: 22.r)),
          bottom: TabBar(
            dividerColor: Colors.transparent, 
            
            indicatorSize: TabBarIndicatorSize.label, 
            
            indicatorColor: ColorsManager.mainPurple,
            indicatorWeight: 3,
            labelStyle: TextStyles.font16WhiteSemiBold,
            unselectedLabelStyle: TextStyles.font14GreyRegular,
            tabs: const [
              Tab(text: 'All Games'),
              Tab(text: 'Downloading'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // (all games)
            _buildAllGamesList(),
            
            // (downloading)
            _buildDownloadingList(),
          ],
        ),
      ),
    );
  }

  Widget _buildAllGamesList() {
    return GridView.builder(
      padding: EdgeInsets.all(20.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.7, 
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const GameLibraryCard();
      },
    );
  }

  Widget _buildDownloadingList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_download_outlined, size: 80.sp, color: ColorsManager.mainGrey),
          verticalSpace(16),
          Text('No active downloads', style: TextStyles.font16WhiteSemiBold),
          Text('Your downloaded games will appear here.', style: TextStyles.font14GreyRegular),
        ],
      ),
    );
  }
}