class OrdersResponseEntity {
  final String? message;
  final List<OrderEntity>? orders;

  OrdersResponseEntity({this.message, this.orders});
}

class OrderEntity {
  final String? id;
  final String? user;
  final List<OrderItemEntity>? orderItems;
  ShippingAddressEntity? shippingAddress;

  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;

  OrderEntity({
    this.id,
    this.user,
    this.shippingAddress,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
  });
}

class OrderItemEntity {
  final ProductEntity? product;
  final int? price;
  final int? quantity;

  OrderItemEntity({this.product, this.price, this.quantity});
}

class ProductEntity {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final int? discount;
  final int? sold;
  final double? rateAvg;
  final int? rateCount;

  ProductEntity({
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
    this.createdAt,
    this.updatedAt,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
  });
}

class ShippingAddressEntity {
  String? street;
  final String? city;
  final String? phone;
  final String? lat;
  final String? long;

  ShippingAddressEntity({
    this.street,
    this.city,
    this.phone,
    this.lat,
    this.long,
  });
}
