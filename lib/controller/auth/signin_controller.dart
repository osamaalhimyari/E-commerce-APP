import '/core/constants/routes.dart';
import '/data/datasource/remote/auth/signin_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  loading();
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
    FirebaseMessaging.instance.getToken().then((value) => (value) {
          print(value);
          String? token = value;
        });
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

  @override
  loading() {
    return statusRequest == StatusRequest.loading;
  }
}
