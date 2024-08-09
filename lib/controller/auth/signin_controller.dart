import 'package:ecommerce1/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late bool hidePassword;
  signIn();
  goToSignUp();
  goToForgetPassword();
  showPasswordText();
}

class SignInControllerImp extends SignInController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  signIn() {
    var formdata = formState.currentState;
    if (!formdata!.validate()) {
      //
    } else {
      // return
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    hidePassword = true;
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  showPasswordText() {
    hidePassword = !hidePassword;
    update();
  }
}
