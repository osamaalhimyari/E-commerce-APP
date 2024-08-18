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

  @override
  void onInit() {
    itemsModel = Get.arguments['itemModel'];
    super.onInit();
  }

  @override
  onAdd() {
    // TODO: implement onAdd
    throw UnimplementedError();
  }

  @override
  onRemove() {
    // TODO: implement onRemove
    throw UnimplementedError();
  }
}
