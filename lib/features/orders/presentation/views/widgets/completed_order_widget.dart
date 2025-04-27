import 'dart:math';

import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/cart/presentation/cubit/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flower_app/features/orders/domain/entites/orders_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CompletedOrderWidget extends StatelessWidget {
  const CompletedOrderWidget({super.key, required this.ordersCompleted});

  final List<OrderEntity> ordersCompleted;

  @override
  Widget build(BuildContext context) {
    return ordersCompleted.isEmpty
        ? Center(
          child: Text(
            'Not found Active Orders',
            style: AppTextStyles.roboto500_18,
          ),
        )
        : Padding(
          padding: EdgeInsets.symmetric(
            vertical: resposiveHeight(16),
            horizontal: resposiveWidth(24),
          ),
          child: ListView.separated(
            itemBuilder: (context, index) {
              double total = calculateOrderTotal(ordersCompleted[index]);
              return Container(
                width: resposiveWidth(319),
                height: resposiveHeight(125),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.greyColor, width: 0.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      ordersCompleted[index]
                              .orderItems?[0]
                              .product
                              ?.images?[0] ??
                          '',
                      width: resposiveWidth(127),
                      height: resposiveHeight(109),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ordersCompleted[index]
                                  .orderItems?[0]
                                  .product
                                  ?.title ??
                              '',
                          style: AppTextStyles.inter400_12,
                        ),
                        Text(
                          "EGP ${total.toString() ?? ''}",
                          style: AppTextStyles.inter500_14,
                        ),
                        Text(
                          "Delivered on ${ordersCompleted[index].isDelivered.toString() ?? ''}",
                          style: AppTextStyles.inter400_12,
                        ),
                        SizedBox(height: resposiveHeight(8)),
                        BlocProvider(
                          create: (context) => getIt.get<AddToCartCubit>(),
                          child: SizedBox(
                            width: resposiveWidth(152),
                            height: resposiveHeight(30),
                            child: BlocListener<AddToCartCubit, AddToCartState>(
                              listener: (context, state) {
                                if (state is AddToCartSuccess) {
                                  print('object');
                                  EasyLoading.dismiss();
                                  EasyLoading.showSuccess("Reorder Success");
                                }
                              },
                              child: ElevatedButton(
                                onPressed: () {
                                  ordersCompleted[index].orderItems?.forEach((
                                    orderItem,
                                  ) {
                                    getIt.get<AddToCartCubit>().AddToCart(
                                      productId: orderItem.product?.id ?? '',
                                      quantity: orderItem.quantity ?? 1,
                                    );
                                  });
                                },
                                child: Text(
                                  "Reorder",
                                  style: AppTextStyles.inter500_13.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: resposiveHeight(16));
            },
            itemCount: ordersCompleted.length,
          ),
        );
  }
}

double calculateOrderTotal(OrderEntity order) {
  double subTotal =
      order.orderItems?.fold(0.0, (sum, item) {
        double itemPrice =
            item.price?.toDouble() ?? item.quantity?.toDouble() ?? 0.0;
        return sum! + (itemPrice * (item.quantity ?? 1));
      }) ??
      0.0;

  double deliveryFee = 10.0;
  return subTotal + deliveryFee;
}
