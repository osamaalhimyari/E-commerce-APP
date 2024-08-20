import '/app_links.dart';
import '/core/class/crud_transactions.dart';

class FavoriteData {
  CrudTrans crud;
  FavoriteData(this.crud);
  addData(String userId, String itemId) async {
    var response = await crud.postData(AppLinks.favoriteAdd, {
      "userid": userId,
      "itemid": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeData(String userId, String itemId) async {
    var response = await crud.postData(AppLinks.favroiteRemove, {
      "userid": userId,
      "itemid": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String favid) async {
    var response = await crud.postData(AppLinks.favroiteDelete, {
      "id": favid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getData(String userid) async {
    var response = await crud.postData(AppLinks.favroiteView, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
