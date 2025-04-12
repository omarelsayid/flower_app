import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../../core/utils/text_styles.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: resposiveHeight(16),horizontal:  resposiveWidth(26)),
      child: Row(
        children: [
          Icon(Icons.logout, size: 16),
          SizedBox(width: resposiveWidth(8),),
          Text('Logout', style: AppTextStyles.inter500_13,),
          Spacer(),
          Icon(Icons.logout, size: 20),
        ],
      ),
    );;
  }
}
