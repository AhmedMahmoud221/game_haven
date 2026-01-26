import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/core/widgets/app_text_button.dart';
import 'package:game_haven/core/widgets/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(50), // Helper function for SizedBox
                Text('Welcome Back,\nPlayer !', style: TextStyles.font32WhiteMedium),
                verticalSpace(8),
                Text('Log in to access your library.', style: TextStyles.font14GreyRegular),
                verticalSpace(40),

                // Email Field
                AppTextFormField(
                  hintText: 'Email',
                  validator: (val) {},
                ),
                verticalSpace(20),
                
                // Password Field
                AppTextFormField(
                  hintText: 'Password',
                  isObscureText: isObscureText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText; // عكس الحالة
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility,
                      color: ColorsManager.mainGrey,
                    ),
                  ),
                  validator: (val) {},
                ),
                
                verticalSpace(30),
                AppTextButton(
                  buttonText: 'Login',
                  onPressed: () {
                    context.pushNamed(Routes.mainScreen);
                  },
                ),
                
                verticalSpace(20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "New here? ", style: TextStyles.font14GreyRegular),
                        TextSpan(
                          text: "Create Account", 
                          style: TextStyles.font14PurpleMedium,
                          // add recognizer for navigation
                          recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(Routes.signupScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}