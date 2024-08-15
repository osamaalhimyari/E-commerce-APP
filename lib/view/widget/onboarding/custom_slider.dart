import '/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoard extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (value) => controller.onPageChanged(value),
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            onBoardingList[index].title ?? '',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 30),
          Image.asset(
            onBoardingList[index].image ?? '',
            width: 200,
            height: 250,
            // color: Colors.red,
            fit: BoxFit.fill,
            // colorBlendMode: ,
          ),
          const SizedBox(height: 80),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(onBoardingList[index].body ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
