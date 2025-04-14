import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/cart/presentation/cubit/get_user_cart_cubit/get_user_cart_cubit.dart';
import 'package:flower_app/features/cart/presentation/views/widgets/cart_widget.dart';
import 'package:flower_app/features/cart/presentation/views/widgets/summery_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../core/services/shared_preference_services.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constans.dart';
import '../../../../core/utils/constant_manager.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  void initState() {
    context.read<GetUserCartCubit>()..GetUserCart();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCartCubit, GetUserCartState>(
      builder: (context, state) {
        if (state is GetUserCartLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else if (state is GetUserCartError) {
          EasyLoading.showError(state.error);
        } else if (state is GetUserCartSuccess) {
          final userCart = state.userCartEntity;
          final cartItems = userCart.cart;

          double subTotal = cartItems.cartItems.fold<double>(
            0,
            (previousValue, element) =>
                previousValue + (element.product.price * element.quantity),
          );
          double deliveryFee = 10.0;
          double total = subTotal + deliveryFee;

          print("+=================================");
          print("sub total is $subTotal");
          print("total is $total");
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Text("Cart", style: AppTextStyles.inter500_20),
                  SizedBox(width: 2,),
                  Text("(${cartItems.cartItems.length} items)",style: AppTextStyles.inter500_16.copyWith(color: AppColors.greyColor),),
                ],
              ),
            ),

            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: resposiveWidth(16),
                vertical: resposiveHeight(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: kVerticalHPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(IconAssets.LocationIcon),
                        Flexible(
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            " Deliver to 2XVP+XC - Sheikh Zayed",
                            style: AppTextStyles.inter400_14,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            print(
                              await SharedPreferenceServices.getData(
                                AppConstants.token,
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 35,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems.cartItems[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CartItemWidget(
                            () {
                              // on delete
                            },
                            () {
                              //on increment
                            },
                            () {
                              //on decrement
                            },
                            cartItem,
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(thickness: 1.0),
                  buildSummaryRow(
                    "Sub Total",
                    "\$${subTotal.toStringAsFixed(2)}",
                  ),
                  buildSummaryRow(
                    "Delivery Fee",
                    "\$${deliveryFee.toStringAsFixed(2)}",
                  ),
                  const Divider(thickness: 1.0),
                  buildSummaryRow(
                    "Total",
                    "\$${total.toStringAsFixed(2)}",
                    isBold: true,
                  ),

                  SizedBox(height: 8,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),

                    onPressed: () {},
                    child: Text(
                      'Continue',
                      style: AppTextStyles.roboto500_16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
