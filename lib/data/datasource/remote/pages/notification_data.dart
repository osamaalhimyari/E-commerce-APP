import 'package:ecommerce2/core/class/crud_transactions.dart';

import '../../../../app_links.dart';

class NotificationData {
  CrudTrans crud;
  NotificationData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLinks.notification, {"userid": id});
    return response.fold((l) => l, (r) => r);
  }
}
