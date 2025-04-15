import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final String slug;
  final String description;
  final String imgCover;
  final List<String> images;
  final int price;
  final int priceAfterDiscount;
  final int quantity;
  final String category;
  final String occasion;
  final int discount;
  final int sold;
  final double rateAvg;
  final int rateCount;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.discount,
    required this.sold,
    required this.rateAvg,
    required this.rateCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
