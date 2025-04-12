import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/text_styles.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.text,
    this.icon,
  });

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: resposiveHeight(16),horizontal:  resposiveWidth(24)),
      child: Row(
        children: [
          if (icon != null) Icon(icon, size: 20),
          SizedBox(width: resposiveWidth(8),),
          Text(text, style: AppTextStyles.inter500_13,),
          Spacer(),
          Icon(Icons.arrow_forward_ios,size: 20,)
        ],
      ),
    );
  }
}

