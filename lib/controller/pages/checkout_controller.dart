import 'package:ecommerce2/core/constants/routes.dart';
import 'package:ecommerce2/core/functions/handling_transaction.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/pages/address_data.dart';
import '../../data/datasource/remote/pages/checkout_date.dart';
import '../../data/model/address_model.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";

  late String couponid;
  late String coupondiscount;
  late String priceorders;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("userid")!);

    print("=============================== Controller $response ");

    statusRequest = handlingTransaction(response);

    if (statusRequest == StatusRequest.success) {
      // Start backend
      // if (response['status'] == "success") {
      List listdata = response['data'];
      dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      // } else {
      //   statusRequest = StatusRequest.success;
      // }
      // End
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
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString()
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingTransaction(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();

    getShippingAddress();
    super.onInit();
  }
}
