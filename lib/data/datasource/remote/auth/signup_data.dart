import '/app_links.dart';
import '/core/class/crud_transactions.dart';

class SignUpData {
  CrudTrans crud;
  SignUpData(this.crud);
  postData(String name, String email, String password, String phone) async {
    var response = await crud.postData(AppLinks.signUp, {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
