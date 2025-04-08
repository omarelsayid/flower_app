import 'package:flower_app/best_seller_products/data/model/ProductModel.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/best_seller_products/presentation/views/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';

class BuildGridItems extends StatelessWidget {
  const BuildGridItems({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: resposiveHeight(16), // Vertical spacing
        crossAxisSpacing: resposiveWidth(16), // Horizontal spacing
        childAspectRatio: resposiveWidth(163) / resposiveHeight(229),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: resposiveWidth(8),
        vertical: resposiveHeight(4),
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CustomProductItem(product: products[index]);
      },
    );
  }
}