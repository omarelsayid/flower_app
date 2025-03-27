class CategoriesResponseEntity {
  CategoriesResponseEntity({
      this.message, 
      // this.metadata,
      this.categories,});

  String? message;
  // CategoriesMetadata? metadata;
  List<CategoriesEntity>? categories;

}

class CategoriesEntity {
  CategoriesEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt, 
      this.productsCount,});

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? productsCount;
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
