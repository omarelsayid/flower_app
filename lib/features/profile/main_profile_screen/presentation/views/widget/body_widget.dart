import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/text_styles.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key, required this.text, this.icon, this.onTap});

  final String text;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: resposiveHeight(16),
        horizontal: resposiveWidth(16),
      ),
      child: Row(
        children: [
          if (icon != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: resposiveWidth(2)),
              child: Icon(icon, size: 20),
            ),
          // SizedBox(width: resposiveWidth(8),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: resposiveWidth(8)),
            child: Text(text, style: AppTextStyles.inter500_13),
          ),
          Spacer(),
          InkWell(onTap: onTap, child: Icon(Icons.arrow_forward_ios, size: 20)),
          SizedBox(width: resposiveWidth(8),)
        ],
      ),
    );
  }
}
