import '/app_links.dart';
import '/core/class/crud_transactions.dart';

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
