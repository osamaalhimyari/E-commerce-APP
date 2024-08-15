import '/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_transaction.dart';
import '../../../data/datasource/remote/forget_password/forget_password_data.dart';

abstract class ForgetPasswordController extends GetxController {
  late TextEditingController email;
  checkEmail();
  loading();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  StatusRequest? statusRequest;

  @override
  checkEmail() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.postData(email.text);

      statusRequest = handlingTransaction(response);

      if (statusRequest == StatusRequest.success) {
        Get.offNamed(AppRoute.verfyCode, arguments: {"email": email.text});
      } else {
        Get.defaultDialog(title: 'Error', middleText: "wrong email");
        statusRequest = StatusRequest.failur;
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  loading() {
    return statusRequest == StatusRequest.loading;
  }
}
