import 'package:ecommerce2/core/services/services.dart';
import 'package:ecommerce2/data/datasource/remote/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_transaction.dart';

abstract class HomePageController extends GetxController {
  late TextEditingController search;
  getData();
  initData();
}

class HomePageControllerImp extends HomePageController {
  MyServices myservices = Get.find();
  String? id;
  String? username;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  late StatusRequest statusRequest;
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();

    statusRequest = handlingTransaction(response);

    if (statusRequest == StatusRequest.success) {
      categories.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  initData() {
    search.dispose();

    throw UnimplementedError();
  }
}
