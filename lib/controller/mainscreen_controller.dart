import 'package:ecommerce2/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/pages/home_page.dart';
import '../view/screen/pages/settings_page.dart';

abstract class MainScreenController extends GetxController {
  changePage(int index);
}

class MainScreenControllerImp extends MainScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const TestView(),
    const TestView(),
    const SettingsPage(),
    // NotificationView() ,
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("Profile"))],
    // ),
    // Settings()
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "n", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
