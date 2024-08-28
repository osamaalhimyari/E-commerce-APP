import 'package:ecommerce2/core/class/crud_transactions.dart';

import '../../../../app_links.dart';

class AddressData {
  CrudTrans crud;
  AddressData(this.crud);
  getData(String userid) async {
    var response =
        await crud.postData(AppLinks.addressview, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String userid, String name, String city, String street, String? lat,
      String? long) async {
    var response = await crud.postData(AppLinks.addressadd, {
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat ?? "",
      "long": long ?? "",
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(AppLinks.addressdelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
