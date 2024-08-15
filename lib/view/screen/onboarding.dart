import '/controller/onboarding_controller.dart';
import '/core/localization/langs/translation.dart';
import '/view/widget/onboarding/custom_botton.dart';
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
        const Expanded(flex: 2, child: CustomSliderOnBoard()),
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
