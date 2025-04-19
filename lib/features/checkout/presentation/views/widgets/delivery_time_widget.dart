import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryTimeWidget extends StatelessWidget {
  const DeliveryTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
      child: Column(
        children: [
          Row(
            children: [
              Text("Delivery time", style: AppTextStyles.inter500_18),
              const Spacer(),
              Text(
                "Schedule",
                style: AppTextStyles.inter600_18.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: resposiveHeight(8)),
          Row(
            children: [
              Icon(Icons.watch_later_outlined),
              SizedBox(width: resposiveWidth(4)),

              Text("Instant,", style: AppTextStyles.inter500_18),
              SizedBox(width: resposiveWidth(4)),
              Text(
                "Arrive by 03 Sep 2024, 11:00 AM",
                style: AppTextStyles.inter500_14.copyWith(
                  color: Color(0xFF0CB359),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
