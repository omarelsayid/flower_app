import 'package:equatable/equatable.dart';

class CategoriesResponseEntity {
  CategoriesResponseEntity({
      this.message, 
      // this.metadata,
      this.categories,});

  String? message;
  // CategoriesMetadata? metadata;
  List<CategoriesEntity>? categories;

}

class CategoriesEntity extends Equatable {
  CategoriesEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,
      this.productsCount,});

  String? id;
  String? name;
  String? slug;
  String? image;
  num? productsCount;

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];
}
//
// class CategoriesMetadata {
//   CategoriesMetadata({
//       this.currentPage,
//       this.limit,
//       this.totalPages,
//       this.totalItems,});
//   num? currentPage;
//   num? limit;
//   num? totalPages;
//   num? totalItems;
//
// }
