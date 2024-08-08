import 'package:ecommerce1/controller/auth/signup_controller.dart';
import 'package:ecommerce1/view/widget/auth/custom_button.dart';
import 'package:ecommerce1/view/widget/auth/custom_text_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/localization/translation.dart';
import '../../widget/auth/custom_text_body.dart';
import '../../widget/auth/custom_text_form.dart';
import '../../widget/auth/custom_text_sign_in_up.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translate.signUp.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        alignment: Alignment.center,
        child: ListView(children: [
          const SizedBox(height: 40),
          CustomBodyAuth(text: Translate.signUpMessage.tr),
          const SizedBox(height: 65),
          CustomTextFormAuth(
              hintText: Translate.enterEmail.tr,
              lableText: Translate.email.tr,
              icon: Icons.email_outlined,
              controller: controller.email),
          CustomTextFormAuth(
              hintText: Translate.enterPhon.tr,
              lableText: Translate.phon.tr,
              icon: Icons.phone,
              controller: controller.phone),
          const SizedBox(height: 25),
          CustomTextFormAuth(
              hintText: Translate.enterPassword,
              lableText: Translate.password.tr,
              icon: Icons.lock_outline,
              controller: controller.password),
          CustomTextFormAuth(
              hintText: Translate.confirmPassword.tr,
              lableText: Translate.password.tr,
              icon: Icons.lock_outline,
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
  }
}
