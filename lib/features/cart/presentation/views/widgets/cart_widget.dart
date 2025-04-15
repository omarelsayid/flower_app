import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../domain/entity/user_cart_entity.dart';

class CartItemWidget extends StatelessWidget {

  CartItemWidget(this.onDelete, this.onIncrement, this.onDecrement,
      this.userCartItem);
  VoidCallback onDelete;
  VoidCallback onIncrement;
  VoidCallback onDecrement;
  CartItemEntity userCartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                userCartItem.product.imgCover,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          userCartItem.product.title,
                          style: AppTextStyles.inter500_16
                        ),
                      ),
                      InkWell(
                        onTap:() => onDelete(),
                        child: Image.asset(IconAssets.deleteIcon)
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                      userCartItem.product.slug,
                    style: AppTextStyles.inter500_13
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                          userCartItem.product.price.toString(),
                        style:AppTextStyles.inter500_16
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed:() => onDecrement(),
                          ),
                          Text(
                            userCartItem.quantity.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => onIncrement(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
