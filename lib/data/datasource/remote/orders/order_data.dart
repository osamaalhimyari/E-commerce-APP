import 'package:ecommerce2/app_links.dart';
import 'package:ecommerce2/core/class/crud_transactions.dart';

class OrderData {
  CrudTrans crud;
  OrderData(this.crud);
  archiveData(String userid) async {
    var response = await crud.postData(AppLinks.ordersarchive, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  getDetailsData(String id) async {
    var response = await crud.postData(AppLinks.ordersdetails, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  notifyData(String id) async {
    var response = await crud.postData(AppLinks.notification, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  getPendingData(String userid) async {
    var response = await crud.postData(AppLinks.pendingorders, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  deletePendingData(String orderid) async {
    var response = await crud.postData(AppLinks.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
