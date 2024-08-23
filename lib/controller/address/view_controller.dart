import 'package:ecommerce2/core/functions/handling_transaction.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/pages/address_data.dart';
import '../../data/model/address_model.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  deleteAddress(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    statusRequest = handlingTransaction(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend

      List listdata = response['data'];
      data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      if (data.isEmpty) {
        statusRequest = StatusRequest.failur;
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
