class SpecificCategoriesResponseEntity {
  SpecificCategoriesResponseEntity({
      this.message, 
      // this.metadata,
      this.products,});


  String? message;
  // Metadata? metadata;
  List<ProductsEntity>? products;
}

class ProductsEntity {
  ProductsEntity({
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
      this.discount, 
      this.sold, 
      this.rateAvg, 
      this.rateCount,});

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
  num? discount;
  num? sold;
  num? rateAvg;
  num? rateCount;


}

// class Metadata {
//   Metadata({
//       this.currentPage,
//       this.totalPages,
//       this.limit,
//       this.totalItems,});
//
//   num? currentPage;
//   num? totalPages;
//   num? limit;
//   num? totalItems;
// }
