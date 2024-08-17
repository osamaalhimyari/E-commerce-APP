import '/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/color_app.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  final String text;
  const CustomButtonOnBoarding({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Container(
        height: 40,
        margin: const EdgeInsets.only(bottom: 30),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
          textColor: Colors.white,
          onPressed: () {
            controller.next();
          },
          color: AppColors.primaryColor,
          child: Text(text),
        ),
      ),
    );
  }
}
