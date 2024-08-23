import 'package:ecommerce2/core/class/status_request.dart';
import 'package:ecommerce2/core/functions/handling_transaction.dart';
import 'package:ecommerce2/core/services/services.dart';
import 'package:ecommerce2/data/datasource/remote/pages/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/item_model.dart';

abstract class ProductDetailsController extends GetxController {
  late TextEditingController search;
  addToCart(int itemId);
  deleteFromCart(int itemId);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemModel itemModel;
  MyServices myservices = Get.find();
  CartData cartData = CartData(Get.find());
  int countitems = 0;
  StatusRequest? statusRequest;

  MyServices myServices = Get.find();

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    itemModel = Get.arguments['itemModel'];
    countitems = 0;
    getCountItems("${itemModel.itemId}");
    super.onInit();
  }

  @override
  addToCart(int itemId) async {
    countitems++;
    // print(itemId);
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addData(
        myServices.sharedPreferences.getString("userid")!, "$itemId");
    // print("=============================== Controller $response ");
    statusRequest = handlingTransaction(response);
    if (StatusRequest.success == statusRequest) {
      Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج الى السلة "));
    }
    update();
  }

  @override
  deleteFromCart(int itemId) async {
    if (countitems > 0) {
      countitems--;

      statusRequest = StatusRequest.loading;
      update();

      var response = await cartData.deleteData(
          myServices.sharedPreferences.getString("userid")!, "$itemId");
      statusRequest = handlingTransaction(response);
      if (StatusRequest.success == statusRequest) {
        // Start backend

        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);

        // End
      }
      update();
      // }
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountData(
        myservices.sharedPreferences.getString("userid")!, itemsid);
    // print("=============================== Controller $response ");
    statusRequest = handlingTransaction(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend

      countitems = int.parse("${response['data']}");
      // print("==================================");
      // print("$countitems");

      // data.addAll(response['data']);
      // End
    }
    update();
  }
}
