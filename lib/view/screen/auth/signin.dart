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
          'sign in ',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        alignment: Alignment.center,
        child: ListView(children: [
          Language(),
          const CustomLogoAuth(),
          const SizedBox(height: 20),
          CustomTitleAuth(text: Translate.welcome.tr),
          const SizedBox(height: 20),
          const CustomBodyAuth(text: 'Sign in with your email and passsword'),
          const SizedBox(height: 65),
          CustomTextFormAuth(
              hintText: 'enter your email',
              lableText: 'email',
              icon: Icons.email_outlined,
              controller: controller.email),
          const SizedBox(height: 25),
          CustomTextFormAuth(
              hintText: 'enter your password',
              lableText: 'password',
              icon: Icons.lock_outline,
              controller: controller.password),
          const Text('forget password?', textAlign: TextAlign.end),
          const SizedBox(height: 25),
          CustomButtonAuth(text: 'sign in', onPressed: () {}),
          const SizedBox(height: 25),
          CustomTextSignInUp(
              text1: 'forget password? ',
              text2: 'Sign Up',
              onTap: () {
                controller.goToSignUp();
              })
        ]),
      ),
    );
  }
}
