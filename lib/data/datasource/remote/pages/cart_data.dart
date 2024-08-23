import '/app_links.dart';
import '/core/class/crud_transactions.dart';

class CartData {
  CrudTrans crud;
  CartData(this.crud);
  addData(String userid, String itemid) async {
    var response = await crud
        .postData(AppLinks.cartadd, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String userid, String itemid) async {
    var response = await crud
        .postData(AppLinks.cartdelete, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  getCountData(String userid, String itemid) async {
    var response = await crud.postData(
        AppLinks.cartgetcountitems, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  viewData(String userid) async {
    var response = await crud.postData(AppLinks.cartview, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(AppLinks.checkcoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}
