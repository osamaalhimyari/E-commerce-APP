import 'package:ecommerce2/controller/shared/search_controller.dart';
import 'package:ecommerce2/core/constants/routes.dart';
import 'package:ecommerce2/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_transaction.dart';

abstract class HomePageController extends SearchMixController {
  getData();
  initData();
  goToItems(int index);
  goToFavorite();
  // searchData();
}

class HomePageControllerImp extends HomePageController {
  MyServices myservices = Get.find();
  String? id;
  String? username;
  List categories = [];
  List items = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();

    statusRequest = handlingTransaction(response);

    if (statusRequest == StatusRequest.success) {
      categories.addAll(response['categories']['data']);
      // ;
      items.addAll(response['items']['data']);
    }
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic("users");
    initData();
    getData();
    super.onInit();
  }

  @override
  initData() {
    search = TextEditingController();
    isSearch = false;
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  goToItems(int index) {
    Get.toNamed(AppRoute.itemsPage, arguments: {
      "categories": categories,
      "index": index,
    });
  }

  @override
  goToFavorite() {
    Get.toNamed(AppRoute.favorite);
  }
}
