import 'package:ecommerce1/core/localization/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/localization/controller/lang_controller.dart';
import '../widget/language/custom_button.dart';

class Language extends GetView<LcaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Translate.hello.tr),
          CustomButtonLanguage(
              textbutton: 'ar',
              onPressed: () {
                controller.changeLocale(const Locale('ar', 'ar'));
                // Get.toNamed(AppRoute.onBoarding);
              }),
          const SizedBox(height: 10),
          CustomButtonLanguage(
              textbutton: 'en',
              onPressed: () {
                controller.changeLocale(const Locale('en', 'us'));
                // Get.toNamed(AppRoute.onBoarding);
              }),
        ],
      ),
    );
  }
}
