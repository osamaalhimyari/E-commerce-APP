import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/success_reset_password_controller.dart';
import '../../../../core/constants/color_app.dart';
import '../../../../core/localization/langs/translation.dart';
import '../../../widget/auth/custom_button.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccenssResetPassWordControllerImp controller =
        Get.put(SuccenssResetPassWordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translate.successResetPassword.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: ColorApp.prymarColor,
            ),
            CustomButtonAuth(
                text: Translate.signIn.tr,
                onPressed: () {
                  controller.goToSignIn();
                }),
          ],
        ),
      ),
    );
  }
}
