import '/app_links.dart';
import '/core/class/crud_transactions.dart';

class HomeData {
  CrudTrans crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLinks.home, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search, String catid) async {
    var response = await crud
        .postData(AppLinks.search, {"search": search, "catid": catid});
    return response.fold((l) => l, (r) => r);
  }
}
