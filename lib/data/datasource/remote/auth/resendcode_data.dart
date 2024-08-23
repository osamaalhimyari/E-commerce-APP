import '../../../../app_links.dart';
import '../../../../core/class/crud_transactions.dart';

class ResendcodeData {
  CrudTrans crud;
  ResendcodeData(this.crud);
  postData(String email, int triedtimes) async {
    var response = await crud.postData(AppLinks.resendCode, {
      "email": email,
      "triedtimes": "$triedtimes",
    }); // "phone": phone,
    return response.fold((l) => l, (r) => r);
  }
}
