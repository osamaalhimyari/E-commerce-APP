import 'package:ecommerce1/view/widget/auth/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forget_password_controller.dart';
import '../../../../core/localization/translation.dart';
import '../../../widget/auth/custom_text_body.dart';
import '../../../widget/auth/custom_text_form.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translate.forgetPassword.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        alignment: Alignment.center,
        child: ListView(children: [
          const SizedBox(height: 20),
          CustomBodyAuth(text: Translate.checkEmail.tr),
          const SizedBox(height: 65),
          CustomTextFormAuth(
              hintText: Translate.enterEmail.tr,
              lableText: Translate.email.tr,
              icon: Icons.email_outlined,
              controller: controller.email),
          const SizedBox(height: 25),
          CustomButtonAuth(
              text: Translate.checkEmail.tr,
              onPressed: () {
                controller.goToVerfyCode();
              }),
          const SizedBox(height: 25),
        ]),
      ),
    );
  }
}
