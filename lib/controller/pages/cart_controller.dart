import 'package:ecommerce2/core/functions/handling_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constants/routes.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/pages/cart_data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/coupon_model.dart';

abstract class CartController extends GetxController {
  refreshPage();
  add(String itemsid);
  goToPageCheckout();
  getTotalPrice();
  delete(String itemsid);
  resetVarCart();
  checkcoupon();
  couponDiscount();

  view();
}

class CartControllerImp extends CartController {
  late TextEditingController controllercoupon;

  CartData cartData = CartData(Get.find());

  // int? discountcoupon = 0;

  // String? couponname;

  // String? couponid;

  StatusRequest? statusRequest;

  CouponModel? couponModel;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountitems = 0;

  @override
  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addData(
        myServices.sharedPreferences.getString("userid")!, itemsid);
    statusRequest = handlingTransaction(response);
    if (StatusRequest.success == statusRequest) {
      Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج الى السلة "));
    }
    update();
  }

  @override
  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(AppRoute.checkoutpage, arguments: {
      "couponid": couponModel == null ? "0" : couponModel!.couponId ?? "0",
      "priceorder": priceorders.toString(),
      "discountcoupon": couponDiscount.toString()
    });
  }

  @override
  getTotalPrice() {
    return (priceorders - priceorders * couponDiscount()! / 100);
  }

  @override
  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteData(
        myServices.sharedPreferences.getString("userid")!, itemsid);
    statusRequest = handlingTransaction(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend

      Get.rawSnackbar(
          title: "اشعار", messageText: const Text("تم ازالة المنتج من السلة "));
      // data.addAll(response['data']);

      // End
    }

    update();
  }

  @override
  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon.text);

    statusRequest = handlingTransaction(response);
    if (StatusRequest.success == statusRequest) {
      Map<String, dynamic> datacoupon = response['data'];
      couponModel = CouponModel.fromJson(datacoupon);
    } else {
      couponModel = null;
      Get.snackbar("Warning", "Coupon Not Valid");
    }
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  couponDiscount() {
    return couponModel == null ? 0 : couponModel!.couponDiscount ?? 0;
  }

  @override
  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  @override
  refreshPage() {
    resetVarCart();
    view();
  }

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .viewData(myServices.sharedPreferences.getString("userid")!);
    statusRequest = handlingTransaction(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success" &&
          response['datacart']['status'] == "success") {
        List dataresponse = response['datacart']['data'];
        Map infoResponse = response['countprice'];
        data.clear();
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
        totalcountitems = int.parse("${infoResponse['itemscount'] ?? 0}");
        priceorders = double.parse("${infoResponse['totalprice'] ?? 0.0}");
      }
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }

  @override
  void dispose() {
    controllercoupon.clear();
    super.dispose();
  }
}
