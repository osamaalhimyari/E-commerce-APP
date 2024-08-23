import 'package:ecommerce2/core/class/crud_transactions.dart';

import '../../../../app_links.dart';

class CheckoutData {
  CrudTrans crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLinks.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
