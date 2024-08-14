import 'package:ecommerce1/app_links.dart';
import 'package:ecommerce1/core/class/crud_transactions.dart';

class TestData {
  CrudTrans crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(AppLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
