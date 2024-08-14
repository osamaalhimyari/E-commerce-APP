// import 'package:ecommerce1/controller/auth/signup_controller.dart';
import 'package:ecommerce1/view/widget/auth/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/signup/signup_controller.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../../core/localization/langs/translation.dart';
import '../../../../core/shared/loading.dart';
import '../../../widget/auth/custom_text_body.dart';
import '../../../widget/auth/custom_text_form.dart';
import '../../../widget/auth/custom_text_sign_in_up.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translate.signUp.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SignUpControllerImp>(builder: (controller) {
        return controller.loading()
            ? const SharedLoading()
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                alignment: Alignment.center,
                child: Form(
                  key: controller.formState,
                  child: ListView(children: [
                    const SizedBox(height: 40),
                    CustomBodyAuth(text: Translate.signUpMessage.tr),
                    const SizedBox(height: 40),
                    CustomTextFormAuth(
                        validator: (val) {
                          return validInput(val!, 1, 20, 'username');
                        },
                        hintText: Translate.enterName.tr,
                        lableText: Translate.name.tr,
                        icon: const Icon(Icons.account_circle_outlined),
                        controller: controller.name),
                    CustomTextFormAuth(
                        validator: (val) {
                          return validInput(val!, 1, 100, 'email');
                        },
                        hintText: Translate.enterEmail.tr,
                        lableText: Translate.email.tr,
                        icon: const Icon(Icons.email_outlined),
                        controller: controller.email),
                    CustomTextFormAuth(
                        validator: (val) {
                          return validInput(val!, 1, 15, 'phone');
                        },
                        hintText: Translate.enterPhon.tr,
                        lableText: Translate.phon.tr,
                        icon: const Icon(Icons.phone),
                        controller: controller.phone),
                    const SizedBox(height: 25),
                    CustomTextFormAuth(
                        validator: (val) {
                          return validInput(val!, 1, 20, 'password');
                        },
                        hintText: Translate.enterPassword,
                        lableText: Translate.password.tr,
                        icon: const Icon(Icons.lock_outline),
                        controller: controller.password),
                    CustomTextFormAuth(
                        validator: (val) {
                          return validConfirmPassword(controller.password.text,
                              controller.confirmPassword.text);
                        },
                        hintText: Translate.confirmPassword.tr,
                        lableText: Translate.password.tr,
                        icon: const Icon(Icons.lock_outline),
                        controller: controller.confirmPassword),
                    Text(Translate.forgetPassword.tr, textAlign: TextAlign.end),
                    const SizedBox(height: 25),
                    CustomButtonAuth(
                        text: Translate.signUp.tr,
                        onPressed: () {
                          controller.signUp();
                        }),
                    const SizedBox(height: 25),
                    CustomTextSignInUp(
                        text1: Translate.haveAccount.tr,
                        text2: Translate.signIn.tr,
                        onTap: () {
                          controller.goToSignIn();
                        })
                  ]),
                ),
              );
      }),
    );
  }
}
