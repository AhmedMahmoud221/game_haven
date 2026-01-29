import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/shared_pref_helper.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/onboarding/widgets/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _items = [
    OnboardingModel(
      image: 'assets/images/onboarding0.png',
      title: 'Explore Gaming Universe',
      description: 'Discover thousands of games, from indie gems to AAA masterpieces.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding1.jpg',
      title: 'Build Your Library',
      description: 'Keep track of your favorites and manage your collection in one place.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding3.jpeg',
      title: 'Join the Community',
      description: 'Read reviews, share your ratings, and connect with fellow gamers.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_items[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            ColorsManager.mainBackground.withValues(alpha: 0.8),
                            ColorsManager.mainBackground,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        Text(
                          _items[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyles.font26WhiteSemiBold,
                        ),
                        verticalSpace(16),
                        Text(
                          _items[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyles.font14GreyRegular,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          Positioned(
            bottom: 50.h,
            left: 24.w,
            right: 24.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    _items.length,
                    (index) => buildIndicator(index),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_currentPage == _items.length - 1) {
                      await SharedPrefHelper.setData('hasSeenOnboarding', true); 
                      
                      if (!context.mounted) return; 
                      
                      Navigator.pushReplacementNamed(context, Routes.loginScreen); 
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: const BoxDecoration(
                      color: ColorsManager.mainPurple,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _currentPage == _items.length - 1 ? Icons.check : Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.h,
      width: _currentPage == index ? 24.w : 8.w,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: _currentPage == index ? ColorsManager.mainPurple : ColorsManager.secondaryGrey,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}