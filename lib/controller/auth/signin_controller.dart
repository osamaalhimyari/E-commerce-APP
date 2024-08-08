import 'package:ecommerce1/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  signIn();
  goToSignUp();
}

class SignInControllerImp extends SignInController {
  @override
  signIn() {
    //
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
