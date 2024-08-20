import 'package:ecommerce2/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/item_model.dart';

abstract class ProductDetailsController extends GetxController {
  late TextEditingController search;
  onAdd();
  onRemove();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemModel itemsModel;
  StatusRequest? statusRequest;
  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    itemsModel = Get.arguments['itemModel'];
    super.onInit();
  }

  @override
  onAdd() {
    //
  }

  @override
  onRemove() {
    //
  }
}
