import 'package:ecommerce2/core/constants/routes.dart';
import 'package:ecommerce2/core/services/services.dart';
import 'package:ecommerce2/data/datasource/remote/pages/items.dart';
import 'package:ecommerce2/data/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_transaction.dart';

abstract class ItemsPageController extends GetxController {
  late TextEditingController search;
  getData();
  initData();
  goToProductDetails(ItemModel item);
  changeSelectedCat(int index);
  goToFavorite();
}

class ItemsPageControllerImp extends ItemsPageController {
  MyServices myservices = Get.find();

  List categories = [];
  late int selectedCat;

  late StatusRequest statusRequest;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  // late StatusRequest statusRequest;
  @override
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await itemsData.getData(
        "${categories[selectedCat]['cat_id']}",
        myservices.sharedPreferences.getString('userid')!);

    statusRequest = handlingTransaction(response);

    if (statusRequest == StatusRequest.success) {
      data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    search = TextEditingController();

    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['index'];
    getData();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  changeSelectedCat(int index) {
    selectedCat = index;
    getData();
    update();
  }

  @override
  goToProductDetails(ItemModel item) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemModel": item});
  }

  @override
  goToFavorite() {
    Get.toNamed(AppRoute.favorite);
  }
}
