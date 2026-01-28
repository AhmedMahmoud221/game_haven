import 'package:flutter/gestures.dart';
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
import 'package:game_haven/features/auth/logic/cubit/login_cubit.dart';
import 'package:game_haven/features/auth/logic/cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return Scaffold(
      backgroundColor: ColorsManager.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Form(
              key: loginCubit.formKey, // الربط مع الـ key اللي في الكيوبيت
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(50),
                  Text('Welcome Back,\nPlayer !', style: TextStyles.font32WhiteMedium),
                  verticalSpace(8),
                  Text('Log in to access your library.', style: TextStyles.font14GreyRegular),
                  verticalSpace(40),

                  // Email Field
                  AppTextFormField(
                    hintText: 'Email',
                    controller: loginCubit.emailController,
                    validator: (val) {
                      if (val == null || val.isEmpty) return 'Please enter your email';
                    },
                  ),
                  verticalSpace(20),

                  // Password Field
                  AppTextFormField(
                    hintText: 'Password',
                    controller: loginCubit.passwordController,
                    isObscureText: isObscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                        color: ColorsManager.mainGrey,
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) return 'Please enter your password';
                    },
                  ),

                  verticalSpace(30),

                  // الـ Listener بالأسماء الصحيحة المتوقعة من Freezed
                  BlocListener<LoginCubit, LoginState>(
                    listenWhen: (previous, current) =>
                        current is Loading || current is Success || current is Error,
                    listener: (context, state) {
                      // لو لسه فيه مشكلة في whenOrNull، استخدمنا هنا الـ maybeMap كحل بديل ومضمون
                      state.maybeWhen(
                        loading: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(child: CircularProgressIndicator()),
                          );
                        },
                        success: (loginResponse) {
                          context.pop(); // قفل الـ loading dialog
                          context.pushNamedAndRemoveUntil(Routes.mainScreen, predicate: (route) => false);
                        },
                        error: (error) {
                          context.pop(); // قفل الـ loading dialog
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error), backgroundColor: Colors.red),
                          );
                        },
                        orElse: () {},
                      );
                    },
                    child: AppTextButton(
                      buttonText: 'Login',
                      onPressed: () {
                        if (loginCubit.formKey.currentState!.validate()) {
                          loginCubit.emitLoginStates();
                        }
                      },
                    ),
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
      ),
    );
  }
}