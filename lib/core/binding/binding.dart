import 'package:ecommerce1/controller/auth/signin_controller.dart';
import 'package:ecommerce1/controller/auth/signup_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => SignInControllerImp(), fenix: true);
  }
}
