import '/core/constants/color_app.dart';
import '/core/localization/langs/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../../controller/auth/success_signup_controller.dart';
import '../../../../controller/auth/signup/success_signup_controller.dart';
import '../../../widget/auth/custom_button.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccenssSignUpControllerImp controller =
        Get.put(SuccenssSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translate.successSignUp.tr,
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
              color: AppColors.prymarColor,
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
