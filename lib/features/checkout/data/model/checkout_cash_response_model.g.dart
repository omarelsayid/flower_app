// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_cash_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutCashResponseModel _$CheckoutCashResponseModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutCashResponseModel(
      message: json['message'] as String?,
      order: json['order'] == null
          ? null
          : CheckoutOrderCashModel.fromJson(
              json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutCashResponseModelToJson(
        CheckoutCashResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order': instance.order,
    };

CheckoutOrderCashModel _$CheckoutOrderCashModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutOrderCashModel(
      user: json['user'] as String?,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) =>
              CheckoutCashOrderItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: json['totalPrice'] as num?,
      paymentType: json['paymentType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      state: json['state'] as String?,
      id: json['_id'] as String?,
      orderNumber: json['orderNumber'] as String?,
      v: json['__v'] as num?,
    )
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$CheckoutOrderCashModelToJson(
        CheckoutOrderCashModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'totalPrice': instance.totalPrice,
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      'state': instance.state,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'orderNumber': instance.orderNumber,
      '_id': instance.id,
      '__v': instance.v,
      'orderItems': instance.orderItems,
    };

CheckoutCashOrderItemsModel _$CheckoutCashOrderItemsModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutCashOrderItemsModel(
      product: json['product'] == null
          ? null
          : CheckoutProductModel.fromJson(
              json['product'] as Map<String, dynamic>),
      price: json['price'] as num?,
      quantity: json['quantity'] as num?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$CheckoutCashOrderItemsModelToJson(
        CheckoutCashOrderItemsModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'quantity': instance.quantity,
      'product': instance.product,
      '_id': instance.id,
    };

CheckoutProductModel _$CheckoutProductModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutProductModel(
      rateAvg: json['rateAvg'] as num?,
      rateCount: json['rateCount'] as num?,
      id: json['_id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      imgCover: json['imgCover'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as num?,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      quantity: json['quantity'] as num?,
      category: json['category'] as String?,
      occasion: json['occasion'] as String?,
      v: json['__v'] as num?,
      sold: json['sold'] as num?,
      discount: json['discount'] as num?,
    );

Map<String, dynamic> _$CheckoutProductModelToJson(
        CheckoutProductModel instance) =>
    <String, dynamic>{
      'rateAvg': instance.rateAvg,
      'rateCount': instance.rateCount,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'sold': instance.sold,
      'discount': instance.discount,
      '_id': instance.id,
      '__v': instance.v,
    };
