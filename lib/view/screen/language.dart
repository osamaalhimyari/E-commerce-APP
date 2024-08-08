import 'package:ecommerce1/core/constants/routes.dart';
import 'package:ecommerce1/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/color_app.dart';
import '../../core/localization/controller/lang_controller.dart';
import '../widget/language/custom_button.dart';

class Language extends GetView<LcaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('hello'.tr),
          CustomButtonLanguage(
              textbutton: 'ar',
              onPressed: () {
                controller.changeLocale(Locale('ar', 'ar'));
                // Get.toNamed(AppRoute.onBoarding);
              }),
          SizedBox(height: 10),
          CustomButtonLanguage(
              textbutton: 'en',
              onPressed: () {
                controller.changeLocale(Locale('en', 'us'));
                // Get.toNamed(AppRoute.onBoarding);
              }),
        ],
      ),
    );
  }
}
