import 'package:ecommerce2/data/model/myfavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_transaction.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/pages/favorite.dart';

// import 'package:flutter/material.dart';
abstract class MyFavoriteController extends GetxController {
  late TextEditingController search;

  setFavorite(int id, String val);

  removeFavorite(String itemsid);
  deleteFromFavorite(String favId);
  getData();
}

class MyFavoriteControllerImp extends MyFavoriteController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  // List data = [];
  List<MyFavoriteModel> data2 = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  // Map<int, String> isFavorite = {};

  @override
  setFavorite(int id, String val) {
    // isFavorite[id] = val;
    update();
  }

  @override
  removeFavorite(String itemsid) async {
    data2.clear();
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

  @override
  deleteFromFavorite(String favId) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    // data.map(
    //   (e) {
    //     print(e['fav_id']);
    //     return e;
    //   },
    // );
    favoriteData.deleteData(favId);
    // data.removeWhere((element) => element['fav_id'] == favId);
    data2.removeWhere((element) => element.favId.toString() == favId);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString('userid')!);
    statusRequest = handlingTransaction(response);

    if (statusRequest == StatusRequest.success) {
      List responsedata = response['data'];
      data2.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
    }
    update();
  }
}
