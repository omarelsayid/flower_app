import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/orders/domain/entites/orders_response_entity.dart';
import 'package:flower_app/features/orders/presentation/views/widgets/completed_order_widget.dart';
import 'package:flutter/material.dart';

class ActiveOrderWidget extends StatelessWidget {
  const ActiveOrderWidget({super.key, required this.ordersActive});
  final List<OrderEntity> ordersActive;

  @override
  Widget build(BuildContext context) {
    return ordersActive.isEmpty
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
              double total = calculateOrderTotal(ordersActive[index]);
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
                      ordersActive[index].orderItems?[0].product?.images?[0] ??
                          '',
                      width: resposiveWidth(127),
                      height: resposiveHeight(109),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ordersActive[index].orderItems?[0].product?.title ??
                              '',
                          style: AppTextStyles.inter400_12,
                        ),
                        Text(
                          "EGP ${total.toString() ?? ''}",
                          style: AppTextStyles.inter500_14,
                        ),
                        Text(
                          "Order Number ${ordersActive[index].orderNumber.toString() ?? ''}",
                          style: AppTextStyles.inter400_12,
                        ),
                        SizedBox(height: resposiveHeight(8)),
                        SizedBox(
                          width: resposiveWidth(152),
                          height: resposiveHeight(30),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Track Order",
                              style: AppTextStyles.inter500_13.copyWith(
                                color: AppColors.whiteColor,
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
            itemCount: ordersActive.length,
          ),
        );
  }
}
