import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/theming/styles.dart';

class CustomAppbarScreen extends StatelessWidget {
  final String textAppbar;
  final IconData? iconData;
  final String? onPressed;
  const CustomAppbarScreen({super.key, required this.textAppbar, this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 42.w,
          height: 42.h,
          decoration: BoxDecoration(
            color: Color(0xfff4f4f4),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: context.pop, 
            icon: Icon(
              Icons.chevron_left,
              size: 32,
              color: Color(0xff707070),
            ),
          ),
        ),
        Text(textAppbar, style: TextStyles.font12AccentPinkRegular),
        Container(
          width: 42.w,
          height: 42.h,
          decoration: BoxDecoration(
            color: Color(0xfff4f4f4),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              if (onPressed != null) {
                context.pushNamed(onPressed!);
              }
            }, 
            icon: Icon(
              iconData, color: Color(0xff707070),
            ),
          ),
        ),
      ],
    );
  }
}
