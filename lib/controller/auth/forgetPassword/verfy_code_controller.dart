import 'package:ecommerce1/core/constants/routes.dart';
import 'package:get/get.dart';

abstract class VerfyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerfyCodeControllerImp extends VerfyCodeController {
  late String code;
  @override
  checkCode() {
    //
    // Get.offAllNamed()
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }
}
