import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/home/products_details/presentation/cubits/product_details_cubit/products_detail_states.dart';
import 'package:flutter/material.dart';

class ReviewTextWidget extends StatelessWidget {
  const ReviewTextWidget({super.key, required this.state});
  final ProductsDetailSuccess state;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 20),
        SizedBox(width: 4),
        Text(
          '${state.productDetailsEntity.rateAvg} (${state.productDetailsEntity.rateCount} Reviews)',
          style: AppTextStyles.inter500_14,
        ),
        Spacer(),
        Text(
          '${state.productDetailsEntity.sold} Sold',
          style: AppTextStyles.inter500_14.copyWith(color: Colors.green),
        ),
      ],
    );
  }
}
