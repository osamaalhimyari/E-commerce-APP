import 'package:ecommerce1/core/constants/routes.dart';
import 'package:get/get.dart';

abstract class SuccenssResetPassWordController extends GetxController {
  goToSignIn();
}

class SuccenssResetPassWordControllerImp
    extends SuccenssResetPassWordController {
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }
}
