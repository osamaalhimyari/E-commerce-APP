import 'package:ecommerce2/core/functions/handling_transaction.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/order_data.dart';
import '../../data/model/order_model.dart';

class OrdersArchiveController extends GetxController {
  OrderData ordersArchiveData = OrderData(Get.find());

  List<OrderModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(int val) {
    if (val == 0) {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(int val) {
    if (val == 0) {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(int val) {
    if (val == 0) {
      return "Pending Approval";
    } else if (val == 1) {
      return "The Order is being Prepared ";
    } else if (val == 2) {
      return "Ready To Picked up by Delivery man";
    } else if (val == 3) {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .archiveData(myServices.sharedPreferences.getString("userid")!);
    statusRequest = handlingTransaction(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failur;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
