import '/controller/auth/signin_controller.dart';
import '/core/class/crud_transactions.dart';
import 'package:get/get.dart';

import '../controller/auth/signup/signup_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CrudTrans());
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => SignInControllerImp(), fenix: true);
  }
}
