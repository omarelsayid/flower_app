class UserCartEntity {
  final String? message;
  final int numOfCartItems;
  final CartEntity cart;

  UserCartEntity({
    required this.message,
    required this.numOfCartItems,
    required this.cart,
  });
}

class CartEntity {
  final String? id;
  final String? user;
  final List<CartItemEntity> cartItems;
  final int discount;
  final int totalPrice;
  final int totalPriceAfterDiscount;

  CartEntity({
    required this.id,
    required this.user,
    required this.cartItems,
    required this.discount,
    required this.totalPrice,
    required this.totalPriceAfterDiscount,
  });
}

class CartItemEntity {
  final ProductEntity product;
  final int price;
  final int quantity;
  final String id;

  CartItemEntity({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });
}

class ProductEntity {
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

  ProductEntity({
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
}
