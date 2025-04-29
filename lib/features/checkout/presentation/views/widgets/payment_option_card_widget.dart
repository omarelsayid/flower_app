import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PaymentOptionCardWidget extends StatelessWidget {
  const PaymentOptionCardWidget({
    super.key,
    required this.selectedValue,
    this.onChanged,
    required this.value,
    required this.title,
  });
  final int selectedValue;
  final void Function(int?)? onChanged;
  final int value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: resposiveWidth(343),
      height: resposiveHeight(52),
      padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x40535353),
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.inter400_16),
          Transform.scale(
            scale: 1.2,
            child: Radio(
              value: value,
              groupValue: selectedValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
