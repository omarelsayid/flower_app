import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_all_notification_response_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({super.key, required this.notification});

  final NotificationsResponseEntity notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.notifications_outlined, size: resposiveWidth(24)),
              SizedBox(width: resposiveWidth(12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title ?? '',
                      style: AppTextStyles.inter600_18.copyWith(fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: resposiveHeight(4)),
                    Text(
                      notification.body ?? '',
                      style: AppTextStyles.inter400_12,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: resposiveHeight(12)),
          Divider(
            height: 1,
            color: AppColors.greyColor,
            thickness: 0.5,
          ),
          SizedBox(height: resposiveHeight(12)),
        ],
      ),
    );
  }
}

