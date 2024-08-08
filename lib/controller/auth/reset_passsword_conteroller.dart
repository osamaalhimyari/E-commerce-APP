import 'package:ecommerce1/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  late TextEditingController password;
  late TextEditingController confirmPassword;
  resetPassword();
  goToSucssesResetCode();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  @override
  resetPassword() {
    //
  }

  @override
  goToSucssesResetCode() {
    Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
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
}
