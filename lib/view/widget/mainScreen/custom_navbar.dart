import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/mainscreen_controller.dart';
import 'custombuttonappbar.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length + 1, ((index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomButtonNavBar(
                          textbutton: controller.bottomappbar[i]['title'],
                          icondata: controller.bottomappbar[i]['icon'],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.currentpage == i ? true : false);
                }))
              ],
            )));
  }
}
