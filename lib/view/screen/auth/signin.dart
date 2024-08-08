import 'package:ecommerce1/controller/auth/signin_controller.dart';
import 'package:ecommerce1/view/widget/auth/custom_button.dart';
import 'package:ecommerce1/view/widget/auth/custom_text_sign_in_up.dart';
import 'package:ecommerce1/view/widget/auth/custom_text_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/localization/translation.dart';
import '../../widget/auth/custom_logo.dart';
import '../../widget/auth/custom_text_body.dart';
import '../../widget/auth/custom_text_form.dart';
import '../language.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInControllerImp controller = Get.put(SignInControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translate.signIn.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        alignment: Alignment.center,
        child: ListView(children: [
          const Language(),
          const CustomLogoAuth(),
          const SizedBox(height: 20),
          CustomTitleAuth(text: Translate.welcome.tr),
          const SizedBox(height: 20),
          CustomBodyAuth(text: Translate.signInMessage.tr),
          const SizedBox(height: 65),
          CustomTextFormAuth(
              hintText: Translate.enterEmail.tr,
              lableText: Translate.email.tr,
              icon: Icons.email_outlined,
              controller: controller.email),
          const SizedBox(height: 25),
          CustomTextFormAuth(
              hintText: Translate.enterPassword.tr,
              lableText: Translate.password.tr,
              icon: Icons.lock_outline,
              controller: controller.password),
          InkWell(
              onTap: () {
                controller.goToForgetPassword();
              },
              child:
                  Text(Translate.forgetPassword.tr, textAlign: TextAlign.end)),
          const SizedBox(height: 25),
          CustomButtonAuth(text: Translate.signIn.tr, onPressed: () {}),
          const SizedBox(height: 25),
          CustomTextSignInUp(
              text1: Translate.dontHaveAccount.tr,
              text2: Translate.signUp.tr,
              onTap: () {
                controller.goToSignUp();
              })
        ]),
      ),
    );
  }
}
