import 'package:equatable/equatable.dart';

class OccasionsResponseEntity {
  OccasionsResponseEntity({
      this.message, 
      this.metadata, 
      this.occasions,});

  String? message;
  Metadata? metadata;
  List<Occasion>? occasions;

}

class Occasion extends Equatable{
   const Occasion({
      this.id, 
      this.name, 
      this.slug, 
      this.image,
      this.productsCount,
  });

  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final num? productsCount;

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
  ];

}
class Metadata {
  Metadata({
      this.currentPage, 
      this.limit, 
      this.totalPages, 
      this.totalItems,});

  num? currentPage;
  num? limit;
  num? totalPages;
  num? totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['limit'] = limit;
    map['totalPages'] = totalPages;
    map['totalItems'] = totalItems;
    return map;
  }

}