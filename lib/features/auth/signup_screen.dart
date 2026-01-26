import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/core/widgets/app_text_button.dart';
import 'package:game_haven/core/widgets/app_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(30),
                  Text('Create Account', style: TextStyles.font32WhiteMedium),
                  verticalSpace(8),
                  Text('Join GameHaven and start your journey.', style: TextStyles.font14GreyRegular),
                  verticalSpace(30),
                  
                  // Name Field
                  AppTextFormField(
                    hintText: 'Full Name',
                    validator: (val) {
                      if (val == null || val.isEmpty) return 'Please enter your name';
                    },
                  ),
                  verticalSpace(16),

                  // Email Field
                  AppTextFormField(
                    hintText: 'Email Address',
                    validator: (val) {
                      if (val == null || !val.contains('@')) return 'Enter a valid email';
                    },
                  ),
                  verticalSpace(16),
                  
                  // Password Field
                  AppTextFormField(
                    hintText: 'Password',
                    isObscureText: isPasswordObscure,
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() => isPasswordObscure = !isPasswordObscure),
                      child: Icon(
                        isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                        color: ColorsManager.mainGrey,
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.length < 6) return 'Password too short';
                    },
                  ),
                  verticalSpace(16),

                  // Confirm Password Field
                  AppTextFormField(
                    hintText: 'Confirm Password',
                    isObscureText: isConfirmPasswordObscure,
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() => isConfirmPasswordObscure = !isConfirmPasswordObscure),
                      child: Icon(
                        isConfirmPasswordObscure ? Icons.visibility_off : Icons.visibility,
                        color: ColorsManager.mainGrey,
                      ),
                    ),
                    validator: (val) {
                      // هنا بنعمل Match للـ Passwords
                    },
                  ),
                  
                  verticalSpace(30),
                  AppTextButton(
                    buttonText: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.pushReplacementNamed(Routes.loginScreen);
                      }
                    },
                  ),
                  
                  verticalSpace(20),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context), // بيرجع للـ Login
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Already have an account? ", style: TextStyles.font14GreyRegular),
                            TextSpan(
                              text: "Login", 
                              style: TextStyles.font14PurpleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}