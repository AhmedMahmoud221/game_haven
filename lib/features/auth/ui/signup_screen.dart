import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/helpers/extensions.dart';
import 'package:game_haven/core/helpers/spacing.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';
import 'package:game_haven/core/widgets/app_text_button.dart';
import 'package:game_haven/core/widgets/app_text_form_field.dart';
import 'package:game_haven/features/auth/logic/cubit/signup_cubit.dart';
import 'package:game_haven/features/auth/logic/cubit/signup_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Form(
              key: signupCubit.formKey,
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
                    controller: signupCubit.nameController,
                    hintText: 'Name',
                    validator: (val) {
                      if (val == null || val.isEmpty) return 'Please enter your name';
                    },
                  ),
                  verticalSpace(16),

                  // Email Field
                  AppTextFormField(
                    controller: signupCubit.emailController,
                    hintText: 'Email Address',
                    validator: (val) {
                      if (val == null || !val.contains('@')) return 'Enter a valid email';
                    },
                  ),
                  verticalSpace(16),

                  // Username Field
                  AppTextFormField(
                    controller: signupCubit.usernameController,
                    hintText: 'User Name',
                    validator: (val) {
                      if (val == null || val.isEmpty) return 'Please enter your user name';
                    },
                  ),
                  verticalSpace(16),
                  
                  // Password Field
                  AppTextFormField(
                    controller: signupCubit.passwordController,
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
                    controller: signupCubit.passwordConfirmController,
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
                      if (val == null || val.isEmpty) return 'Please confirm your password';
                      if (val != signupCubit.passwordController.text) return 'Passwords do not match';
                    },
                  ),
                  
                  verticalSpace(30),
                  BlocListener<SignupCubit, SignupState>(
                    listenWhen: (previous, current) =>
                        current is Loading || current is Success || current is Error,
                    listener: (context, state) {
                      state.maybeWhen(
                        loading: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(child: CircularProgressIndicator()),
                          );
                        },
                        success: (loginResponse) {
                          context.pop(); 
                          context.pushNamedAndRemoveUntil(Routes.mainScreen, predicate: (route) => false);
                        },
                        error: (error) {
                          context.pop(); 
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error), backgroundColor: Colors.red),
                          );
                        },
                        orElse: () {},
                      );
                    },
                    child: AppTextButton(
                      buttonText: 'Signup',
                      onPressed: () {
                        if (signupCubit.formKey.currentState?.validate() ?? false) {
                          signupCubit.emitSignupStates();
                        }
                      },
                    ),
                  ),
                  
                  verticalSpace(20),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
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