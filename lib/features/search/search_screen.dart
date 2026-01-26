import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/core/widgets/app_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Text('Search', style: TextStyles.font26WhiteSemiBold),
              verticalSpace(16),
              
              // Search Bar
              AppTextFormField(
                hintText: 'Search for games...',
                suffixIcon: const Icon(Icons.search, color: ColorsManager.mainGrey),
                backgroundColor: ColorsManager.cardGrey,
                validator: (val) => null,
              ),
              
              verticalSpace(24),
              Text('Recently Searched', style: TextStyles.font18WhiteMedium),
              verticalSpace(16),
              
              // لستة بالبحث القديم (مثال)
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  _buildRecentSearchChip('Elden Ring'),
                  _buildRecentSearchChip('Cyberpunk 2077'),
                  _buildRecentSearchChip('FIFA 24'),
                  _buildRecentSearchChip('God of War'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentSearchChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorsManager.cardGrey,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(label, style: TextStyles.font14GreyRegular),
    );
  }
}