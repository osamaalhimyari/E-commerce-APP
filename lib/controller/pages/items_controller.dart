import 'package:ecommerce2/core/constants/routes.dart';
import 'package:ecommerce2/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';

abstract class ItemsPageController extends GetxController {
  late TextEditingController search;
  getData();
  initData();
  // goToItems(Map selectedCat);
  changeSelectedCat(int index);
}

class ItemsPageControllerImp extends ItemsPageController {
  MyServices myservices = Get.find();

  List categories = [];
  late int selectedCat;

  late StatusRequest statusRequest;
  @override
  getData() async {}

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    search = TextEditingController();
    // getData();
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['index'];
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  changeSelectedCat(int index) {
    selectedCat = index;
    update();
  }
}
