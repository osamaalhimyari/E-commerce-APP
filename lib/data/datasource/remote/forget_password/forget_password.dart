import 'package:ecommerce1/app_links.dart';
import 'package:ecommerce1/core/class/crud_transactions.dart';

class ForgetPassword {
  CrudTrans crud;
  ForgetPassword(this.crud);
  postData(String email) async {
    var response = await crud.postData(AppLinks.forgetPassword, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
