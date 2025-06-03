import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class BottomInfoCard extends StatelessWidget {
  const BottomInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: resposiveWidth(10)),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Estimated arrival'),
                  Row(children: [Text('03 Sep 2024, '), Text('11:00 AM')]),
                ],
              ),
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
            ],
          ),
        ),
        SizedBox(height: resposiveHeight(16)),
      ],
    );
  }
}
