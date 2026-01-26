import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorsManager.mainPurple),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(
          Size(double.infinity, 52.h), // طول الزرار زي اللي في الصورة
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r), // حواف ناعمة
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyles.font16WhiteSemiBold, // استخدمنا الـ Style اللي جهزناه
      ),
    );
  }
}