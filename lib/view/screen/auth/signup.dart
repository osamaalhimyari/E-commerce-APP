import 'package:ecommerce1/controller/auth/signup_controller.dart';
import 'package:ecommerce1/view/widget/auth/custom_button.dart';
import 'package:ecommerce1/view/widget/auth/custom_text_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          'sign up ',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        alignment: Alignment.center,
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTitleAuth(text: 'Wilcom Back'),
          const SizedBox(height: 20),
          const CustomBodyAuth(text: 'Sign up with your email and passsword'),
          const SizedBox(height: 65),
          CustomTextFormAuth(
              hintText: 'enter your email',
              lableText: 'email',
              icon: Icons.email_outlined,
              controller: controller.email),
          CustomTextFormAuth(
              hintText: 'enter your phon',
              lableText: 'phon',
              icon: Icons.phone,
              controller: controller.phone),
          const SizedBox(height: 25),
          CustomTextFormAuth(
              hintText: 'enter your password',
              lableText: 'password',
              icon: Icons.lock_outline,
              controller: controller.password),
          CustomTextFormAuth(
              hintText: 'confirm  password',
              lableText: 'password',
              icon: Icons.lock_outline,
              controller: controller.confirmPassword),
          const Text('forget password?', textAlign: TextAlign.end),
          const SizedBox(height: 25),
          CustomButtonAuth(text: 'sign in', onPressed: () {}),
          const SizedBox(height: 25),
          CustomTextSignInUp(
              text1: 'have account already? ',
              text2: 'Sign In',
              onTap: () {
                controller.goToSignIn();
              })
        ]),
      ),
    );
  }
}
