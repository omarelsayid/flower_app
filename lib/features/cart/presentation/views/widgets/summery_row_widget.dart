import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';

Widget buildSummaryRow(String label, String value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold ? AppTextStyles.inter500_16 : AppTextStyles.inter500_14,
        ),
        Text(
          value,
          style: isBold ? AppTextStyles.inter500_16 : AppTextStyles.inter500_14,
        ),
      ],
    ),
  );
}
