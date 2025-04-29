import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_app/features/home/best_seller_products/data/model/ProductModel.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PagesRoutes.productDetails,arguments: product.id
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFA6A6A6), width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: product.imgCover ?? '',
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: resposiveWidth(147),
              height: resposiveHeight(131),
              fit: BoxFit.cover,
            ),
            SizedBox(height: resposiveHeight(8)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.inter400_12.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: resposiveHeight(4)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP ${product.priceAfterDiscount?.round().toInt() ?? ''}',
                      style: AppTextStyles.inter500_14.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),

                    Text(
                      '${product.price?.round().toInt() ?? ''}',
                      style: AppTextStyles.inter400_12.copyWith(
                        color: AppColors.blackColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),

                    Text(
                      '${product.discount?.round().toInt() ?? ''}%',
                      style: AppTextStyles.inter400_12.copyWith(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: resposiveHeight(8)),
            Expanded(
              child: SizedBox(
                width: resposiveWidth(147),
                height: resposiveHeight(30),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.white),
                      Text(
                        'Add to cart',
                        style: AppTextStyles.inter500_14.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
