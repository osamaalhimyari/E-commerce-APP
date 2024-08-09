import 'package:ecommerce1/core/constants/routes.dart';
import 'package:get/get.dart';

abstract class VerfyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerfyCodeSignUpControllerImp extends VerfyCodeSignUpController {
  late String code;
  @override
  checkCode() {
    //
    // Get.offAllNamed()
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }
}
