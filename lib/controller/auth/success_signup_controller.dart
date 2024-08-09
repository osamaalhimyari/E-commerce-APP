import 'package:ecommerce1/core/constants/routes.dart';

import 'package:get/get.dart';

abstract class SuccenssSignUpController extends GetxController {
  goToSignIn();
}

class SuccenssSignUpControllerImp extends SuccenssSignUpController {
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }
}
