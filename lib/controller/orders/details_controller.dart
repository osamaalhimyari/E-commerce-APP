import 'dart:async';

import 'package:ecommerce2/core/functions/handling_transaction.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../data/datasource/remote/orders/order_data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/order_model.dart';

class OrdersDetailsController extends GetxController {
  OrderData ordersDetailsData = OrderData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  late OrderModel orderModel;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? cameraPosition;

  intialData() {
    if (orderModel.orderType == 0) {
      cameraPosition = CameraPosition(
        target: LatLng(
            orderModel.addressLat ?? 0.00, orderModel.addressLong ?? 0.00),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(orderModel.addressLat ?? 0.00,
              (orderModel.addressLong ?? 0.00))));
    }
  }

  @override
  void onInit() {
    orderModel = Get.arguments['ordermodel'];
    intialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response =
        await ordersDetailsData.getDetailsData("${orderModel.orderId}");

    statusRequest = handlingTransaction(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failur;
      }
      // End
    }
    update();
  }
}
