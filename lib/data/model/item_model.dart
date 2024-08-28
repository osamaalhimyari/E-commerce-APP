class ItemModel {
  int? itemId;
  String? itemNameEn;
  String? itemNameAr;
  String? itemDescEn;
  String? itemDescAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  int? itemPrice;
  int? itemDiscount;
  int? itemDate;
  int? itemCat;
  int? catId;
  String? catNameEn;
  String? catNameAr;
  String? catImage;
  String? catDatetime;
  String? catDescription;
  int? favorite;
  int? itempricedisount;

  ItemModel(
      {this.itemId,
      this.itemNameEn,
      this.itemNameAr,
      this.itemDescEn,
      this.itemDescAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCat,
      this.catId,
      this.catNameEn,
      this.catNameAr,
      this.catImage,
      this.catDatetime,
      this.catDescription,
      this.favorite,
      this.itempricedisount});

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemNameEn = json['item_name_en'];
    itemNameAr = json['item_name_ar'];
    itemDescEn = json['item_desc_en'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
    catId = json['cat_id'];
    catNameEn = json['cat_name_en'];
    catNameAr = json['cat_name_ar'];
    catImage = json['cat_image'];
    catDatetime = json['cat_datetime'];
    catDescription = json['cat_description'];
    favorite = json['favorite'];
    itempricedisount = json['itempricedisount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name_en'] = itemNameEn;
    data['item_name_ar'] = itemNameAr;
    data['item_desc_en'] = itemDescEn;
    data['item_desc_ar'] = itemDescAr;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_date'] = itemDate;
    data['item_cat'] = itemCat;
    data['cat_id'] = catId;
    data['cat_name_en'] = catNameEn;
    data['cat_name_ar'] = catNameAr;
    data['cat_image'] = catImage;
    data['cat_datetime'] = catDatetime;
    data['cat_description'] = catDescription;
    data['favorite'] = favorite;
    data['itempricedisount'] = itempricedisount;
    return data;
  }
}
