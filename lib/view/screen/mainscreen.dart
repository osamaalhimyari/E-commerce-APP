import 'package:ecommerce2/core/functions/alert_exit_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/mainscreen_controller.dart';
import '../../core/constants/color_app.dart';
// import '../../core/constants/routes.dart';
import '../../core/constants/routes.dart';
import '../widget/mainScreen/custom_navbar.dart';
// import '../widget/mainScreen/custombuttonappbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenControllerImp());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => alertExitApp(),
      child: GetBuilder<MainScreenControllerImp>(
          builder: (controller) => Scaffold(
                floatingActionButton: FloatingActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      Get.toNamed(AppRoute.cartPage);
                    },
                    child: const Icon(
                      Icons.shopping_basket_outlined,
                      color: Colors.white,
                    )),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: const CustomBottomNavBar(),
                body: controller.listPage.elementAt(controller.currentpage),
              )),
    );
  }
}
