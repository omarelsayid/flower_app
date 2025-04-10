import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../../core/utils/text_styles.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: resposiveHeight(16),horizontal:  resposiveWidth(16)),
      child: Row(
        children: [
          Icon(Icons.language, size: 20),
          SizedBox(width: resposiveWidth(8),),
          Text('Language', style: AppTextStyles.inter500_13,),
          Spacer(),
          Text('English', style: AppTextStyles.inter400_12.copyWith(fontSize:10,color: AppColors.primaryColor),),
        ],
      ),
    );;
  }
}
