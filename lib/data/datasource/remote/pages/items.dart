import '/app_links.dart';
import '/core/class/crud_transactions.dart';

class ItemsData {
  CrudTrans crud;
  ItemsData(this.crud);
  getData(String id, String userId) async {
    var response =
        await crud.postData(AppLinks.items, {"catid": id, "userid": userId});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLinks.search, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
