import 'package:ecommerce1/app_links.dart';
import 'package:ecommerce1/core/class/crud_transactions.dart';

class SignInData {
  CrudTrans crud;
  SignInData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLinks.signIn, {
      "email": email,
      "password": password,
    }); // "phone": phone,
    return response.fold((l) => l, (r) => r);
  }
}
