class CheckoutCashResponseEntity {
  CheckoutCashResponseEntity({
      this.message, 
      this.order,});
  String? message;
  CheckoutOrderCashEntity? order;

}

class CheckoutOrderCashEntity {
  CheckoutOrderCashEntity({
      this.user, 
      this.orderItems, 
      this.totalPrice, 
      this.paymentType, 
      this.isPaid, 
      this.isDelivered, 
      this.state, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.orderNumber, 
      this.v,});

  String? user;
  List<CheckoutCashOrderItemsEntity>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;

}

class CheckoutCashOrderItemsEntity {
  CheckoutCashOrderItemsEntity({
      this.product, 
      this.price, 
      this.quantity, 
      this.id,});

  CheckoutProductEntity? product;
  num? price;
  num? quantity;
  String? id;
}

class CheckoutProductEntity {
  CheckoutProductEntity({
      this.rateAvg, 
      this.rateCount, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.imgCover, 
      this.images, 
      this.price, 
      this.priceAfterDiscount, 
      this.quantity, 
      this.category, 
      this.occasion,
      this.v, 
      this.sold, 
      this.discount, 
  });

  num? rateAvg;
  num? rateCount;
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  num? v;
  num? sold;
  num? discount;

}