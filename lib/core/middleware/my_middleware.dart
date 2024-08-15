import '/core/constants/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    int passOnBoarding = myServices.sharedPreferences.getInt('step') ?? 0;
    switch (passOnBoarding) {
      case 1:
        return const RouteSettings(name: AppRoute.signIn);
      case 2:
        return const RouteSettings(name: AppRoute.home);

      default:
    }

    return null;
  }
}
