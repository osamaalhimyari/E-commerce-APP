import 'package:ecommerce1/core/middleware/my_middleware.dart';
import 'package:ecommerce1/view/screen/auth/verfy_code_signUp.dart';
import 'package:ecommerce1/view/screen/onboarding.dart';
import 'package:get/get.dart';

import 'core/constants/routes.dart';
import 'view/screen/auth/ForgetPassword/forget_password.dart';
import 'view/screen/auth/ForgetPassword/reset_password.dart';
import 'view/screen/auth/ForgetPassword/verfy_code.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/success_signup.dart';
import 'view/screen/auth/signin.dart';
import 'view/screen/auth/ForgetPassword/success_reset_password.dart';

List<GetPage<dynamic>>? routesPages = [
  GetPage(
      name: AppRoute.onBoarding,
      page: () => const OnBoarding(),
      middlewares: [MyMiddleware()]),
  GetPage(name: AppRoute.signIn, page: () => const SignIn()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfyCode, page: () => const VerfyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.verfyCodeSignUp, page: () => const VerfyCodeSignUp()),
];
