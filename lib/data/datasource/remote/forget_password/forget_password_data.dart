import '/app_links.dart';
import '/core/class/crud_transactions.dart';

class ForgetPasswordData {
  CrudTrans crud;
  ForgetPasswordData(this.crud);
  postData(String email) async {
    var response = await crud.postData(AppLinks.forgetPassword, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
