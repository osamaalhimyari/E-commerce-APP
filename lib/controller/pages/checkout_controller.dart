import 'package:ecommerce2/core/constants/routes.dart';
import 'package:ecommerce2/core/functions/handling_transaction.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/pages/address_data.dart';
import '../../data/datasource/remote/pages/checkout_data.dart';
import '../../data/model/address_model.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  int? paymentMethod;
  int? deliveryType;
  int addressid = 0;

  late int couponid;
  late int coupondiscount;
  late double priceorders;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(int val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(int val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(int val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("userid")!);

    statusRequest = handlingTransaction(response);
    // print('========================$response');
    if (statusRequest == StatusRequest.success) {
      List listdata = response['data'];
      dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "userid": myServices.sharedPreferences.getString("userid"),
      "addressid": "$addressid",
      "orderstype": "$deliveryType",
      "pricedelivery": "${10}",
      "ordersprice": "$priceorders",
      "couponid": "$couponid",
      "paymentmethod": "$addressData",
      "coupondiscount": "$coupondiscount"
    };

    var response = await checkoutData.checkout(data);

    statusRequest = handlingTransaction(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend

      Get.offAllNamed(AppRoute.home);
      Get.snackbar("Success", "the order was successfully");

      // End
    } else {
      statusRequest = StatusRequest.none;
      Get.snackbar("Error", "try again");
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'];

    getShippingAddress();
    super.onInit();
  }
}
