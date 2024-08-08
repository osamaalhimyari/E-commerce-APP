import 'package:ecommerce1/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  @override
  signUp() {
    //
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }

  @override
  void onInit() {
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
