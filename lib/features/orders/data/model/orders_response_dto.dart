import 'package:flower_app/features/orders/domain/entites/orders_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_response_dto.g.dart';

@JsonSerializable()
class OrdersResponseDTO {
  final String? message;
  final Metadata? metadata;
  final List<Order>? orders;

  OrdersResponseDTO({this.message, this.metadata, this.orders});

  factory OrdersResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersResponseDTOToJson(this);

  OrdersResponseEntity toEntity() => OrdersResponseEntity(
    message: message,
    orders: orders?.map((e) => e.toEntity()).toList(),
  );
}

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? totalPages;
  final int? limit;
  final int? totalItems;

  Metadata({this.currentPage, this.totalPages, this.limit, this.totalItems});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: '_id')
  final String? id;
  final String? user;
  final List<OrderItem>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;

  Order({
    this.id,
    this.user,
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

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  OrderEntity toEntity() => OrderEntity(
    id: id,
    user: user,
    orderItems: orderItems?.map((e) => e.toEntity()).toList(),
    totalPrice: totalPrice,
    paymentType: paymentType,
    isPaid: isPaid,
    isDelivered: isDelivered,
    state: state,
    createdAt: createdAt,
    updatedAt: updatedAt,
    orderNumber: orderNumber,
  );
}

@JsonSerializable()
class OrderItem {
  final Product? product;
  final int? price;
  final int? quantity;

  OrderItem({this.product, this.price, this.quantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  OrderItemEntity toEntity() => OrderItemEntity(
    product: product?.toEntity(),
    price: price,
    quantity: quantity,
  );
}

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    slug: slug,
    description: description,
    imgCover: imgCover,
    images: images,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    quantity: quantity,
    category: category,
    occasion: occasion,
    createdAt: createdAt,
    updatedAt: updatedAt,
    discount: discount,
    sold: sold,
    rateAvg: rateAvg,
    rateCount: rateCount,
  );
}
