import 'package:ecommerce1/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  late TextEditingController email;
  // late TextEditingController confirmPassword;
  resetPassword();
  goToSucssesSignUp();
}

class CheckEmailControllerImp extends CheckEmailController {
  @override
  resetPassword() {
    //
  }

  @override
  goToSucssesSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    // confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    // confirmPassword.dispose();
    super.dispose();
  }
}
