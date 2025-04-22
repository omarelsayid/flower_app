import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key, required this.total});
  final List<double> total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).subTotal,
              style: AppTextStyles.roboto400_16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            Text(
              "\$${total[2].toStringAsFixed(2)}",
              style: AppTextStyles.roboto400_16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
        SizedBox(height: resposiveHeight(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).deliveryFee,
              style: AppTextStyles.roboto400_16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            Text(
              "\$${total[1].toStringAsFixed(2)}",
              style: AppTextStyles.roboto400_16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
        SizedBox(height: resposiveHeight(8)),
        Divider(color: AppColors.greyColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).total, style: AppTextStyles.roboto500_18),
            Text(
              "\$${total[0].toStringAsFixed(2)}",
              style: AppTextStyles.roboto500_18,
            ),
          ],
        ),

        SizedBox(height: resposiveHeight(24)),
      ],
    );
  }
}
