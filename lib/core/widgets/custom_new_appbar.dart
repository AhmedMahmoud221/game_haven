import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/theming/styles.dart';

class CustomNewAppbar extends StatelessWidget {
  final String textAppbar;
  const CustomNewAppbar({super.key, required this.textAppbar});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 42.w,
            height: 42.h,
            decoration: BoxDecoration(
              color: Color(0xfff4f4f4),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: context.pop,
              icon: Icon(Icons.chevron_left, size: 32, color: Color(0xff707070)),
            ),
          ),
        ),
        Text(
          textAppbar,
          style: TextStyles.font12AccentPinkRegular,
        ),
      ],
    );
  }
}
