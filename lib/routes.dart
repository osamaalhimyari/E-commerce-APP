import 'core/constants/routes.dart';
import 'view/screen/auth/ForgetPassword/forget_password.dart';
import 'view/screen/auth/ForgetPassword/reset_password.dart';
import 'view/screen/auth/ForgetPassword/verfy_code.dart';
import 'view/screen/auth/check_email.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/success_signup.dart';
import 'view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'view/screen/auth/signin.dart';
import 'view/screen/auth/ForgetPassword/success_reset_password.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.signIn: (context) => const SignIn(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.verfyCode: (context) => const VerfyCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.onBoarding: (context) => const OnBoarding(),
  AppRoute.checkEmail: (context) => const CheckEmail(),
  AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
  AppRoute.successSignUp: (context) => const SuccessSignUp()
};
