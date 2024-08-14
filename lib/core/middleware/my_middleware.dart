import 'package:ecommerce1/core/constants/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    bool passOnBoarding =
        myServices.sharedPreferences.getBool('passOnBoarding') ?? false;

    if (passOnBoarding) {
      return const RouteSettings(name: AppRoute.signIn);
    }
    return null;
  }
}
