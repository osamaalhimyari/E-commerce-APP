import 'package:ecommerce1/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/color_app.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotsControllerOnBoarding extends StatelessWidget {
  const CustomDotsControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(milliseconds: 900),
                    width: controller.currentPage == index ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: AppColors.prymarColor,
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
