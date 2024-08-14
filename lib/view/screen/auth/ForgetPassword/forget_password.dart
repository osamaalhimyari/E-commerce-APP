import 'package:ecommerce1/core/functions/valid_input.dart';
import 'package:ecommerce1/view/widget/auth/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetPassword/forget_password_controller.dart';
import '../../../../core/localization/langs/translation.dart';
import '../../../../core/shared/loading.dart';
import '../../../widget/auth/custom_text_body.dart';
import '../../../widget/auth/custom_text_form.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Translate.forgetPassword.tr,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) {
            return controller.loading()
                ? const SharedLoading()
                : Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    alignment: Alignment.center,
                    child: Form(
                      key: controller.formState,
                      child: ListView(children: [
                        const SizedBox(height: 20),
                        CustomBodyAuth(text: Translate.checkEmail.tr),
                        const SizedBox(height: 65),
                        CustomTextFormAuth(
                            validator: (val) {
                              return validInput(val!, 3, 20, 'email');
                            },
                            hintText: Translate.enterEmail.tr,
                            lableText: Translate.email.tr,
                            icon: const Icon(Icons.email_outlined),
                            controller: controller.email),
                        const SizedBox(height: 25),
                        CustomButtonAuth(
                            text: Translate.checkEmail.tr,
                            onPressed: () {
                              controller.checkEmail();
                            }),
                        const SizedBox(height: 25),
                      ]),
                    ),
                  );
          },
        ));
  }
}
