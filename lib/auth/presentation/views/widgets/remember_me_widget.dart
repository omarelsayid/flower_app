import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class RememberMeWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RememberMeWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: AppColors.primaryColor,
          value: value,
          onChanged: onChanged,
        ),
        SizedBox(width: 1),
        Text('Remember me', style: AppTextStyles.inter400_14),
      ],
    );
  }
}
