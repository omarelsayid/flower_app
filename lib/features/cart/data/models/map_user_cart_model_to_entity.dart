import 'package:flower_app/features/cart/data/models/user_cart_response/user_cart_response_model.dart';
import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';

class MapUserCartToEntity {
  static UserCartEntity mapToEntity(UserCartResponseModel model) {
    return UserCartEntity(
      message: model.message, // assuming message is always provided
      numOfCartItems: model.numOfCartItems,
      cart: CartEntity(
        id: model.cart.id,
        user: model.cart.user ?? '', // provide an empty string if null
        discount: model.cart.discount,
        totalPrice: model.cart.totalPrice,
        totalPriceAfterDiscount: model.cart.totalPriceAfterDiscount,
        cartItems: model.cart.cartItems.map((item) {
          return CartItemEntity(
            product: ProductEntity(
              id: item.product.id,
              title: item.product.title ?? 'No title',  // default value if null
              slug: item.product.slug ?? '',
              description: item.product.description ?? '',
              imgCover: item.product.imgCover ?? '',
              images: item.product.images ?? [],        // default empty list if null
              price: item.product.price,
              priceAfterDiscount: item.product.priceAfterDiscount,
              quantity: item.product.quantity,
              category: item.product.category ?? '',
              occasion: item.product.occasion ?? '',
              discount: item.product.discount,
              sold: item.product.sold,
              rateAvg: item.product.rateAvg,
              rateCount: item.product.rateCount,
            ),
            price: item.price,
            quantity: item.quantity,
            id: item.id,
          );
        }).toList(),
      ),
    );
  }
}
