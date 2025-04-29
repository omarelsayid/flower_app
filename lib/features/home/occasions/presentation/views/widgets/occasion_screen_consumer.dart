import 'package:flower_app/features/cart/presentation/cubit/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flower_app/features/home/occasions/domain/entity/products_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../../core/widgets/flower_card.dart';

class OccasionScreenConsumer extends StatelessWidget {
  OccasionScreenConsumer({super.key, required this.product});
  Products product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess && state.id == product.id) {
          EasyLoading.showSuccess(state.message);
        } else if (state is AddToCartError && state.id == product.id) {
          EasyLoading.showError(state.error);
        }
      },
      builder: (context, state) {
        final isLoading = state is AddToCartLoading && state.id == product.id;
        return FlowerCard(
          isLoading: isLoading,
          onAddToCart: () {
            context.read<AddToCartCubit>().AddToCart(
              productId: product.id!,
              quantity: 1,
            );
          },
          name: product.title.toString(),
          beforeDiscount: "${product.discount}",
          discountRate: "${product.priceAfterDiscount}%",
          cost: '${product.price}',
          imageUrl: '${product.imgCover}',
          id: "${product.id}",
        );
      },
    );
  }
}
