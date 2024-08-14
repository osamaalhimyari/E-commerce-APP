import 'package:ecommerce1/app_links.dart';
import 'package:ecommerce1/core/class/crud_transactions.dart';

class VerfyCodeSignUpData {
  CrudTrans crud;
  VerfyCodeSignUpData(this.crud);
  postData(String email, String verfyCode) async {
    var response = await crud.postData(AppLinks.verfySignUp, {
      "email": email,
      "verfycode": verfyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
