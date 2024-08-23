import 'package:ecommerce2/core/constants/routes.dart';
import 'package:ecommerce2/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myservices = Get.find();

  @override
  logout() {
    myservices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.signIn);
  }
}
