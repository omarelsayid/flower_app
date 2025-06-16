import 'package:flower_app/features/cart/data/models/user_cart_response/user_cart_response_model.dart';
import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';

class MapUserCartToEntity {
  static UserCartEntity mapToEntity(UserCartResponseModel? model) {
    return UserCartEntity(
      message: model?.message,
      numOfCartItems: model?.numOfCartItems ?? 0,
      cart: CartEntity(
        id: model?.cart?.id ?? '',
        user: model?.cart?.user ?? '', // Provide a default empty string if null
        discount: model?.cart?.discount ?? 0,
        totalPrice: model?.cart?.totalPrice ?? 0,
        totalPriceAfterDiscount: model?.cart?.totalPriceAfterDiscount ?? 0,
        cartItems:
            model?.cart?.cartItems != null
                ? model!.cart!.cartItems!.map((item) {
                  return CartItemEntity(
                    product: ProductEntity(
                      id: item.product?.id ?? '',
                      title: item.product?.title ?? 'No title',
                      slug: item.product?.slug ?? '',
                      description: item.product?.description ?? '',
                      imgCover: item.product?.imgCover ?? '',
                      images: item.product?.images ?? [],
                      price: item.product?.price ?? 0,
                      priceAfterDiscount: item.product?.priceAfterDiscount ?? 0,
                      quantity: item.product?.quantity ?? 0,
                      category: item.product?.category ?? '',
                      occasion: item.product?.occasion ?? '',
                      discount: item.product?.discount ?? 0,
                      sold: item.product?.sold ?? 0,
                      rateAvg: item.product?.rateAvg ?? 0.0,
                      rateCount: item.product?.rateCount ?? 0,
                    ),
                    price: item.price ?? 0,
                    quantity: item.quantity ?? 0,
                    id: item.id ?? '',
                  );
                }).toList()
                : [],
      ),
    );
  }
}
