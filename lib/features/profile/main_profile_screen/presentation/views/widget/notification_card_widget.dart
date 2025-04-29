import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_all_notification_response_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class NotificationCardWidget extends StatelessWidget {
   NotificationCardWidget({super.key,required this.notification});
NotificationsResponseEntity notification;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.notifications_outlined),
              SizedBox(width: resposiveWidth(8)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title.toString(),
                    style: AppTextStyles.inter600_18.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: resposiveHeight(8)),
                  Text(
                    notification.body.toString(),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.inter400_12,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: resposiveHeight(8)),
        Divider(
          height: 5,
          color: AppColors.greyColor,
          thickness: .6,
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
