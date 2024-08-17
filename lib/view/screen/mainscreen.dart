import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/mainscreen_controller.dart';
import '../../core/constants/color_app.dart';
// import '../../core/constants/routes.dart';
import '../widget/mainScreen/custom_navbar.dart';
// import '../widget/mainScreen/custombuttonappbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('main screen');

    Get.put(MainScreenControllerImp());
    return GetBuilder<MainScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    // Get.toNamed(AppRoute.cart) ;
                  },
                  child: const Icon(Icons.shopping_basket_outlined)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomNavBar(),
              body: controller.listPage.elementAt(controller.currentpage),
            ));
  }
}
