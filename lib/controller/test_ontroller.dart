import 'package:ecommerce1/core/class/status_request.dart';
import 'package:ecommerce1/core/functions/handling_transaction.dart';
import 'package:ecommerce1/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  // Get.find()
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();

    statusRequest = handlingTransaction(response);

    if (statusRequest == StatusRequest.success) {
      data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}