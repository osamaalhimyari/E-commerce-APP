import 'package:ecommerce1/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constants/routes.dart';
import '../../../core/functions/handling_transaction.dart';

abstract class SignUpController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  SignUpData signUpData = SignUpData(Get.find());
  // List data = [];
  StatusRequest? statusRequest;

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          name.text, email.text, password.text, phone.text);

      statusRequest = handlingTransaction(response);

      if (statusRequest == StatusRequest.success) {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.verfyCodeSignUp,
            arguments: {"email": email.text});
      } else {
        Get.defaultDialog(
            title: 'Error', middleText: "Phone or Email  Already Exists");
        statusRequest = StatusRequest.failur;
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.back(canPop: true);
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
