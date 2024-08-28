import 'package:ecommerce2/core/functions/handling_transaction.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constants/routes.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/pages/address_data.dart';
import '../../data/model/address_model.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  dynamic x;

  deleteAddress(AddressModel address) {
    addressData.deleteData("${address.addressId}");
    data.remove(address);
    update();
  }

  goToAddAddress() async {
    x = await Get.toNamed(AppRoute.addressdetail);
    if (x == "success") {
      getData();
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("userid")!);

    statusRequest = handlingTransaction(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      List listdata = response['data'];
      data.clear();
      data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      if (listdata.isEmpty) {
        statusRequest = StatusRequest.none;
      }

      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
