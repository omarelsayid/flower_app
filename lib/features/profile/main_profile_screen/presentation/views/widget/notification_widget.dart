import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Row(
      children: [
        Transform.scale(
          scale: .7,  // control switch size
          child: Switch(
            value: true,
            onChanged: (value) {},
            // active
            activeColor: AppColors.whiteColor,
            activeTrackColor:AppColors.primaryColor,
            //inactive
            inactiveThumbColor: AppColors.whiteColor,
            inactiveTrackColor: AppColors.greyColor,
          ),
        ),
        Text('Notifications', style: AppTextStyles.inter500_13,),
        Spacer(),
        Icon(Icons.arrow_forward_ios,size: 20,),
        SizedBox(width: resposiveWidth(16),)
      ],
    );
  }
}
