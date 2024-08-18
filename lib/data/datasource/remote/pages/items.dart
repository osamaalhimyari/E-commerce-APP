import '/app_links.dart';
import '/core/class/crud_transactions.dart';

class ItemsData {
  CrudTrans crud;
  ItemsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLinks.items, {"catid": id});
    return response.fold((l) => l, (r) => r);
  }
}
