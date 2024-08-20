import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_transaction.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/pages/favorite.dart';

// import 'package:flutter/material.dart';
abstract class FavoriteControlle extends GetxController {
  setFavorite(int id, String val);
  addFavorite(String itemsid);
  removeFavorite(String itemsid);
}

class FavoriteControllerImp extends FavoriteControlle {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map<int, String> isFavorite = {};

  @override
  setFavorite(int id, String val) {
    isFavorite[id] = val;
    update();
  }

  @override
  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addData(
        myServices.sharedPreferences.getString("userid")!, itemsid);

    statusRequest = handlingTransaction(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend

      Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج من المفضلة "));
      // data.addAll(response['data']);
    }
  }

  @override
  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeData(
        myServices.sharedPreferences.getString("userid")!, itemsid);

    statusRequest = handlingTransaction(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend

      Get.rawSnackbar(
          title: "اشعار", messageText: const Text("تم حذف المنتج من المفضلة "));
      // data.addAll(response['data']);
    }
  }
}
