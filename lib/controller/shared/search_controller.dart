import 'package:ecommerce2/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_transaction.dart';
import '../../data/datasource/remote/pages/home.dart';

class SearchMixController extends GetxController {
  late TextEditingController search;
  int catid = 0;
  bool isSearch = false;
  List itemsSearched = [];

  HomeData homeData = HomeData(Get.find());
  StatusRequest? statusRequest;

  searchData() async {
    itemsSearched.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.searchData(search.text, "$catid");
    statusRequest = handlingTransaction(response);
    if (statusRequest == StatusRequest.success) {
      itemsSearched.addAll(response['data']);
    }
    update();
  }

  onSearchchange(String text) {
    if (text.isEmpty || text == "") {
      isSearch = false;
      statusRequest = null;
    } else {
      isSearch = true;
    }
    update();
  }

  onGoingBack() {
    search.clear();
    isSearch = false;
    update();
  }

  goToPageProductDetails(itemModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemModel": itemModel});
  }
}
