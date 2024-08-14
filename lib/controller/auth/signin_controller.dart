import 'package:ecommerce1/core/constants/routes.dart';
import 'package:ecommerce1/data/datasource/remote/auth/signin_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_transaction.dart';

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
  SignInData signInData = SignInData(Get.find());
  // List data = [];
  StatusRequest? statusRequest;
  @override
  signIn() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signInData.postData(email.text, password.text);

      statusRequest = handlingTransaction(response);

      if (statusRequest == StatusRequest.success) {
        Get.offNamed(AppRoute.home);
      } else {
        Get.defaultDialog(
            title: 'Error', middleText: "wrong email or password ");
        statusRequest = StatusRequest.failur;
      }
      update();
    } else {}
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
