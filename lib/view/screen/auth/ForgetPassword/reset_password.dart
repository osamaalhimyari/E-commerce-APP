import 'package:ecommerce1/view/widget/auth/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetPassword/reset_passsword_conteroller.dart';
import '../../../../core/localization/langs/translation.dart';
import '../../../widget/auth/custom_text_form.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translate.resetPassword.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        alignment: Alignment.center,
        child: ListView(children: [
          const SizedBox(height: 65),
          CustomTextFormAuth(
              validator: (val) {
                return null;
              },
              hintText: Translate.enterPassword.tr,
              lableText: Translate.password.tr,
              icon: const Icon(Icons.lock_outline),
              controller: controller.password),
          CustomTextFormAuth(
              validator: (val) {
                return null;
              },
              hintText: Translate.confirmPassword.tr,
              lableText: Translate.password.tr,
              icon: const Icon(Icons.lock_outline),
              controller: controller.confirmPassword),
          const SizedBox(height: 25),
          CustomButtonAuth(
              text: Translate.signIn.tr,
              onPressed: () {
                controller.goToSucssesResetCode();
              }),
          const SizedBox(height: 25),
        ]),
      ),
    );
  }
}
