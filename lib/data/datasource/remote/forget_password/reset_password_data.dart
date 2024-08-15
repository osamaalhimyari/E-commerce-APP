import '/app_links.dart';
import '/core/class/crud_transactions.dart';

class ResetPasswordData {
  CrudTrans crud;
  ResetPasswordData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLinks.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
