
import 'package:flower_app/features/checkout/domain/entites/checkout_cash_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_cash_response_model.g.dart';

@JsonSerializable()
class CheckoutCashResponseModel extends CheckoutCashResponseEntity {
  CheckoutCashResponseModel({super.message, this.order});

  @JsonKey(name: 'order')
  final CheckoutOrderCashModel? order;

  factory CheckoutCashResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutCashResponseModelFromJson(json);
}

@JsonSerializable()
class CheckoutOrderCashModel extends CheckoutOrderCashEntity {
  CheckoutOrderCashModel({
    super.user,
    this.orderItems,
    super.totalPrice,
    super.paymentType,
    super.isPaid,
    super.isDelivered,
    super.state,
    this.id,
    super.orderNumber,
    this.v,
  });

  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "__v")
  final num? v;
  @JsonKey(name: "orderItems")
  final List<CheckoutCashOrderItemsModel>? orderItems;

  factory CheckoutOrderCashModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutOrderCashModelFromJson(json);
}

@JsonSerializable()
class CheckoutCashOrderItemsModel extends CheckoutCashOrderItemsEntity {
  CheckoutCashOrderItemsModel({
    this.product,
    super.price,
    super.quantity,
    this.id,
  });

  @JsonKey(name: "product")
  final CheckoutProductModel? product;
  @JsonKey(name: "_id")
  final String? id;

  factory CheckoutCashOrderItemsModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutCashOrderItemsModelFromJson(json);
}

@JsonSerializable()
class CheckoutProductModel extends CheckoutProductEntity {
  CheckoutProductModel({
    super.rateAvg,
    super.rateCount,
    this.id,
    super.title,
    super.slug,
    super.description,
    super.imgCover,
    super.images,
    super.price,
    super.priceAfterDiscount,
    super.quantity,
    super.category,
    super.occasion,
    this.v,
    super.sold,
    super.discount,
  });

  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "__v")
  final num? v;

  factory CheckoutProductModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutProductModelFromJson(json);
}
