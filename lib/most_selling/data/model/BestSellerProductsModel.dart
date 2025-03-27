import 'package:flower_app/most_selling/data/model/ProductModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BestSellerProductsModel.g.dart';

@JsonSerializable()
class BestSellerProductsModel {
  BestSellerProductsModel({this.message, this.bestSeller});
  String? message;
  List<ProductModel>? bestSeller;

  factory BestSellerProductsModel.fromJson(Map<String, dynamic> json) =>
      _$BestSellerProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerProductsModelToJson(this);
}
