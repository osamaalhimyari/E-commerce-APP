import 'package:ecommerce1/core/constants/routes.dart';
import 'package:ecommerce1/view/screen/auth/login.dart';
import 'package:ecommerce1/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => Login(),
  AppRoute.onBoarding: (context) => OnBoarding()
};
