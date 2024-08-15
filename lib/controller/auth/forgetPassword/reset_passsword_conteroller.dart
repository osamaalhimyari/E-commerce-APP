import '/core/class/status_request.dart';
import '/core/constants/routes.dart';
import '/data/datasource/remote/forget_password/reset_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/handling_transaction.dart';

abstract class ResetPasswordController extends GetxController {
  late TextEditingController password;
  late TextEditingController confirmPassword;
  resetPassword();
  loading();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late String email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest? statusRequest;
  @override
  resetPassword() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email, password.text);

      statusRequest = handlingTransaction(response);
      if (statusRequest == StatusRequest.success) {
        Get.offNamed(AppRoute.successResetPassword);
      } else {
        // approved = false;
        Get.defaultDialog(title: 'Error', middleText: "unKonkwn Error");
        statusRequest = StatusRequest.failur;
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  loading() {
    return statusRequest == StatusRequest.loading;
  }
}
