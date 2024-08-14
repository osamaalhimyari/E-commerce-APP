import 'package:ecommerce1/core/constants/routes.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_transaction.dart';
import '../../../data/datasource/remote/auth/verfycode_signup_data.dart';

abstract class VerfyCodeSignUpController extends GetxController {
  checkCode(String verfyCode);
  changeApproved(bool state);
  loading();
}

class VerfyCodeSignUpControllerImp extends VerfyCodeSignUpController {
  late String? email;
  late bool approved = true;
  VerfyCodeSignUpData verfyCodeSignUpData = VerfyCodeSignUpData(Get.find());
  StatusRequest? statusRequest;
  @override
  changeApproved(bool state) {
    approved = state;
    update();
  }

  @override
  checkCode(String verfyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfyCodeSignUpData.postData(email!, verfyCode);

    statusRequest = handlingTransaction(response);
    if (statusRequest == StatusRequest.success) {
      Get.offNamed(AppRoute.successSignUp);
    } else {
      approved = false;
      Get.defaultDialog(
          title: 'Error', middleText: "verfication code is not correct");
      statusRequest = StatusRequest.failur;
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  loading() {
    return statusRequest == StatusRequest.loading;
  }
}
