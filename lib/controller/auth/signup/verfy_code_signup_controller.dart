import 'package:ecommerce2/data/datasource/remote/auth/resendcode_data.dart';

import '../../../core/services/services.dart';
import '/core/constants/routes.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_transaction.dart';
import '../../../data/datasource/remote/auth/verfycode_signup_data.dart';

abstract class VerfyCodeSignUpController extends GetxController {
  checkCode(String verfyCode);
  changeApproved(bool state);
  loading();
  reSendCode();
}

class VerfyCodeSignUpControllerImp extends VerfyCodeSignUpController {
  late String? email;
  late bool approved = true;
  VerfyCodeSignUpData verfyCodeSignUpData = VerfyCodeSignUpData(Get.find());
  ResendcodeData resendVCode = ResendcodeData(Get.find());
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
      await myservices.sharedPreferences.setInt('step', 2);
      Get.offNamed(AppRoute.home);
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

  MyServices myservices = Get.find();
  @override
  reSendCode() async {
    statusRequest = StatusRequest.loading;
    update();
    await resendVCode.postData(email!, 1);

    statusRequest = StatusRequest.success;
  }
}
