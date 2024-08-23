class CartModel {
  int? totalprice;
  int? itemscount;
  int? cartId;
  int? cartUserid;
  int? cartItemid;
  int? itemId;
  String? itemNameEn;
  String? itemNameAr;
  String? itemDescEn;
  String? itemDescAr;
  String? itemImage;
  // int? itemCount;
  int? itemActive;
  int? itemPrice;
  int? itemDiscount;
  int? itemDate;
  int? itemCat;

  CartModel(
      {this.totalprice,
      this.itemscount,
      this.cartId,
      this.cartUserid,
      this.cartItemid,
      this.itemId,
      this.itemNameEn,
      this.itemNameAr,
      this.itemDescEn,
      this.itemDescAr,
      this.itemImage,
      // this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    totalprice = json['totalprice'];
    itemscount = json['itemscount'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    itemId = json['item_id'];
    itemNameEn = json['item_name_en'];
    itemNameAr = json['item_name_ar'];
    itemDescEn = json['item_desc_en'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    // itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalprice'] = totalprice;
    data['itemscount'] = itemscount;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemid'] = cartItemid;
    data['item_id'] = itemId;
    data['item_name_en'] = itemNameEn;
    data['item_name_ar'] = itemNameAr;
    data['item_desc_en'] = itemDescEn;
    data['item_desc_ar'] = itemDescAr;
    data['item_image'] = itemImage;
    // data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_date'] = itemDate;
    data['item_cat'] = itemCat;
    return data;
  }
}
