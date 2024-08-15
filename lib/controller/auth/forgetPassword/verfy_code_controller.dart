import '/core/constants/routes.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_transaction.dart';
import '../../../data/datasource/remote/forget_password/verfycode_forgetpassword_data.dart';

abstract class VerfyCodeController extends GetxController {
  checkCode(String verfyCode);
  loading();
}

class VerfyCodeControllerImp extends VerfyCodeController {
  late String email;
  VerfyCodeForgetPasswordData verfyCodeForgetPassData =
      VerfyCodeForgetPasswordData(Get.find());
  StatusRequest? statusRequest;
  @override
  checkCode(String verfyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfyCodeForgetPassData.postData(email, verfyCode);

    statusRequest = handlingTransaction(response);
    if (statusRequest == StatusRequest.success) {
      Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
    } else {
      // approved = false;
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
