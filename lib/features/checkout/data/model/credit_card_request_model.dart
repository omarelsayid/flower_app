class CreditCardRequestModel {
  CreditCardRequestModel({this.shippingAddress});

  ShippingAddress? shippingAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (shippingAddress != null) {
      map['shippingAddress'] = shippingAddress?.toJson();
    }
    return map;
  }
}

class ShippingAddress {
  ShippingAddress({this.street, this.phone, this.city, this.lat, this.long});
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    map['lat'] = lat;
    map['long'] = long;
    return map;
  }
}
