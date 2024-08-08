import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/color_app.dart';
import '../../../../core/localization/translation.dart';
import '../../../widget/auth/custom_button.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translate.successResetPassword.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 200,
              color: ColorApp.prymarColor,
            ),
            CustomButtonAuth(text: Translate.signIn.tr, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
