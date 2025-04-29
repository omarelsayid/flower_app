import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/generated/l10n.dart';
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
              Text(
                S.of(context).deliveryTime,
                style: AppTextStyles.inter500_18,
              ),
              const Spacer(),
              Text(
                S.of(context).schedule,
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

              Text(S.of(context).instant, style: AppTextStyles.inter500_18),
              SizedBox(width: resposiveWidth(4)),
              Expanded(
                child: Text(
                  "${S.of(context).arriveBy} 03 Sep 2024, 11:00 AM",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.inter500_14.copyWith(
                    color: Color(0xFF0CB359),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
