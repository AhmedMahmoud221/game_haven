import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/features/auth/logic/cubit/login_cubit.dart';

class ProfileMenuItems extends StatelessWidget {
  const ProfileMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorsManager.cardGrey,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 5,
        separatorBuilder: (context, index) => Divider(
          color: Colors.white.withAlpha(30),
          thickness: 1,
          indent: 20.w,
          endIndent: 20.w,
        ),
        itemBuilder: (context, index) {
          final items = [
            {'icon': Icons.person_outline, 'title': 'Edit Profile', 'isLogout': false, 'onTap': () {}},
            {'icon': Icons.notifications_none, 'title': 'Notifications', 'isLogout': false, 'onTap': () {}},
            {'icon': Icons.security, 'title': 'Security', 'isLogout': false, 'onTap': () {}},
            {'icon': Icons.help_outline, 'title': 'Help & Support', 'isLogout': false, 'onTap': () {}},
            {'icon': Icons.logout, 'title': 'Logout', 'isLogout': true, 'onTap': () => _showLogoutDialog(context)},
          ];

          return _MenuTile(
            icon: items[index]['icon'] as IconData,
            title: items[index]['title'] as String,
            isLogout: items[index]['isLogout'] as bool,
            onTap: items[index]['onTap'] as VoidCallback,
          );
        },
      ),
    );
  }

  // Logout Dialog Function
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF1B1B1B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text("Logout", style: TextStyles.font18WhiteMedium),
        content: Text(
          "Are you sure you want to exit?",
          style: TextStyles.font14GreyRegular,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
          ),
          TextButton(
            onPressed: () async {
              await context.read<LoginCubit>().logout();
              if (context.mounted) {
                context.pushNamedAndRemoveUntil(
                  Routes.loginScreen,
                  predicate: (route) => false,
                );
              }
            },
            child: Text("Logout", style: TextStyle(color: Colors.redAccent, fontSize: 14.sp, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

// Menu Tile Widget
class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color contentColor = isLogout ? Colors.redAccent : Colors.white;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: EdgeInsets.all(8.r),
          child: Icon(icon, color: contentColor, size: 24.sp),
        ),
        title: Text(
          title,
          style: TextStyles.font16WhiteSemiBold.copyWith(
            color: contentColor,
            fontSize: 15.sp,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: isLogout ? Colors.redAccent.withAlpha(150) : Colors.grey.withAlpha(150),
          size: 14.sp,
        ),
      ),
    );
  }
}