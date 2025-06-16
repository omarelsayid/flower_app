class UserCartEntity {
  final String? message;
  final int? numOfCartItems;
  final CartEntity? cart;

  UserCartEntity({this.message, this.numOfCartItems, this.cart});
}

class CartEntity {
  final String? id;
  final String? user;
  final List<CartItemEntity>? cartItems;
  final int? discount;
  final int? totalPrice;
  final int? totalPriceAfterDiscount;

  CartEntity({
    this.id,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
  });
}

class CartItemEntity {
  final ProductEntity? product;
  final int? price;
  final int? quantity;
  final String? id;

  CartItemEntity({this.product, this.price, this.quantity, this.id});
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
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
  });
}
