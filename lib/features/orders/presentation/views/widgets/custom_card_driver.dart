import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/orders/data/model/orders_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:timelines_plus/timelines_plus.dart';
// enum OrderStatus {
//   received,
//   preparing,
//   outForDelivery,
//   delivered,
// }
class CustomCardDriver extends StatelessWidget {
   CustomCardDriver({super.key,required this.index});
  int index ;
  Status mapStringToOrderStatus(int? status) {
    switch (status) {
      case 0:
        return Status.order;
      case 1:
        return Status.shipped;
      case 2:
        return Status.outOfDelivery;
      case 3:
        return Status.delivered;
      default:
        return Status.order;
    }
  }
  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(ImageAssets.deliveryBoy),
              SizedBox(width: resposiveWidth(16)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mohamed",
                    style: AppTextStyles.inter500_14.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: resposiveHeight(4)),
                  Text(
                    "Is your delivery here for today",
                    style: AppTextStyles.inter400_12.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox(width: resposiveWidth(16))),
              Icon(Icons.phone, color: AppColors.primaryColor),
              SizedBox(width: resposiveWidth(8)),
              ImageIcon(
                AssetImage(IconAssets.whatsAppIcon),
                color: AppColors.primaryColor,
              ),
            ],
          ),
          SizedBox(height: resposiveHeight(40)),
          Image.asset(ImageAssets.carImage),
          SizedBox(height: resposiveHeight(40)),
       OrderTracker(
         status: mapStringToOrderStatus(index),
         activeColor: AppColors.primaryColor,


       )
        ],
      ),
    );
  }
}
