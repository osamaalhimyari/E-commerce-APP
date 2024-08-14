import 'package:ecommerce1/app_links.dart';
import 'package:ecommerce1/core/class/crud_transactions.dart';

class VerfyCodeForgetPasswordData {
  CrudTrans crud;
  VerfyCodeForgetPasswordData(this.crud);
  postData(String email, String verfycode) async {
    var response = await crud.postData(AppLinks.verfyCode, {
      "email": email,
      "verfycode": verfycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
