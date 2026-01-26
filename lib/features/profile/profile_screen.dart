import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              verticalSpace(30),
              // 1. Header (صورة البروفايل والاسم)
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          backgroundImage: const AssetImage('assets/images/login_logo.png'),
                        ),
                        CircleAvatar(
                          radius: 18.r,
                          backgroundColor: ColorsManager.mainPurple,
                          child: Icon(Icons.edit, color: Colors.white, size: 18.sp),
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    Text('Ahmed Gamer', style: TextStyles.font26WhiteSemiBold),
                    Text('Level 24 • Pro Explorer', style: TextStyles.font14GreyRegular),
                  ],
                ),
              ),

              verticalSpace(30),
              // 2. Stats Row (أرقام سريعة)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem('Games', '42'),
                  _buildStatItem('Achievements', '128'),
                  _buildStatItem('Friends', '1.2k'),
                ],
              ),

              verticalSpace(40),
              // 3. Settings Menu (قائمة الخيارات)
              _buildMenuCard([
                _buildMenuItem(Icons.person_outline, 'Edit Profile'),
                _buildMenuItem(Icons.notifications_none, 'Notifications'),
                _buildMenuItem(Icons.security, 'Security'),
                _buildMenuItem(Icons.help_outline, 'Help & Support'),
              ]),

              verticalSpace(20),
              // زرار تسجيل الخروج
              _buildMenuItem(Icons.logout, 'Logout', isLogout: true),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }

  // Widget للأرقام الإحصائية
  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: TextStyles.font18WhiteMedium),
        Text(label, style: TextStyles.font13GreyRegular),
      ],
    );
  }

  // Widget لكارت المنيو
  Widget _buildMenuCard(List<Widget> items) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsManager.cardGrey,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(children: items),
    );
  }

  // Widget للعنصر الواحد في القائمة
  Widget _buildMenuItem(IconData icon, String title, {bool isLogout = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.redAccent : Colors.white),
        title: Text(
          title,
          style: TextStyles.font16WhiteSemiBold.copyWith(
            color: isLogout ? Colors.redAccent : Colors.white,
          ),
        ),
        trailing: isLogout ? null : const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () {},
      ),
    );
  }
}