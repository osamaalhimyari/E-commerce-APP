import 'package:ecommerce1/core/constants/routes.dart';
import 'package:ecommerce1/view/screen/auth/signup.dart';
import 'package:ecommerce1/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'view/screen/auth/signin.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.signIn: (context) => const SignIn(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.onBoarding: (context) => const OnBoarding()
};
