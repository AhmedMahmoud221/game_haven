
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/font_weight_helper.dart';

class TextStyles {
// العناوين الرئيسية الكبيرة (زي Find your perfect game)
  static TextStyle font26WhiteSemiBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.mainWhite, // أبيض بدل اللون القديم
  );

  // العناوين الفرعية تحت الألعاب أو الأقسام
  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainGrey,
  );

  // نصوص الزراير (Buy Now)
  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  // عناوين صفحات الدخول (Login / Signup)
  static TextStyle font32WhiteMedium = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.mainWhite,
  );

  // نصوص الـ TextFields (العناوين اللي فوق المربع)
  static TextStyle font14SecondaryGreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondaryGrey,
  );

  // الروابط أو الكلام اللي محتاج تمييز (زي SignUp)
  static TextStyle font14PurpleMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.mainPurple, // اللون البنفسجي بدل الأزرق
  );

  // اسم المستخدم في الهوم
  static TextStyle font18WhiteMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.mainWhite,
  );

  // سعر اللعبة في الكروت (Price Tag)
  static TextStyle font14PurpleSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.mainPurple,
  );

  // وصف اللعبة الصغير (Description)
  static TextStyle font13GreyRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainGrey,
  );
  
  // نصوص التنبيهات أو الـ Hurry! Offer expires
  static TextStyle font12AccentPinkRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.accentPink,
  );
}
