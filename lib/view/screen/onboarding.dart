import 'package:ecommerce1/controller/onboarding_controller.dart';
import 'package:ecommerce1/core/localization/translation.dart';
import 'package:ecommerce1/view/widget/onboarding/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/onboarding/custom_dots_controller.dart';
import '../widget/onboarding/custom_slider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Expanded(flex: 3, child: CustomSliderOnBoard()),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                const CustomDotsControllerOnBoarding(),
                const Spacer(flex: 2),
                CustomButtonOnBoarding(text: Translate.continue_.tr)
              ],
            ))
      ],
    )));
  }
}
