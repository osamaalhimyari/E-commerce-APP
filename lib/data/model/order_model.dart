class OrderModel {
  int? orderId;
  int? orderUserid;
  int? orderAddressid;
  int? orderType;
  int? orderPaymethod;
  int? orderDeliveryprice;
  int? orderPrice;
  int? orderCoupon;
  String? orderDate;
  int? orderState;
  double? orderTotalprice;
  int? addressId;
  int? addressUserid;
  String? addressName;
  double? addressLat;
  double? addressLong;
  String? addressCity;
  String? addressStreet;

  OrderModel(
      {this.orderId,
      this.orderUserid,
      this.orderAddressid,
      this.orderType,
      this.orderPaymethod,
      this.orderDeliveryprice,
      this.orderPrice,
      this.orderCoupon,
      this.orderDate,
      this.orderState,
      this.orderTotalprice,
      this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressLat,
      this.addressLong,
      this.addressCity,
      this.addressStreet});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderAddressid = json['order_addressid'];
    orderType = json['order_type'];
    orderPaymethod = json['order_paymethod'];
    orderDeliveryprice = json['order_deliveryprice'];
    orderPrice = json['order_price'];
    orderCoupon = json['order_coupon'];
    orderDate = json['order_date'];
    orderState = json['order_state'];
    orderTotalprice = double.parse("${json['order_totalprice']}");
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_userid'] = orderUserid;
    data['order_addressid'] = orderAddressid;
    data['order_type'] = orderType;
    data['order_paymethod'] = orderPaymethod;
    data['order_deliveryprice'] = orderDeliveryprice;
    data['order_price'] = orderPrice;
    data['order_coupon'] = orderCoupon;
    data['order_date'] = orderDate;
    data['order_state'] = orderState;
    data['order_totalprice'] = orderTotalprice;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_name'] = addressName;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    return data;
  }
}
