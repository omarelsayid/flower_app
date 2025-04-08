import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, required this.txt, required this.leading_text, required this.onPressed});

  final String txt;
  final String leading_text;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: AppTextStyles.inter500_18.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onPressed,

          child: Text(
            leading_text,
            style: AppTextStyles.inter600_12.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
