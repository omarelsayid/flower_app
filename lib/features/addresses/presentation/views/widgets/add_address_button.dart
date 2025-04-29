import 'package:flutter/material.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/generated/l10n.dart';

class AddAddressButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddAddressButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        S.of(context).add_new_addresses,
        style: AppTextStyles.inter500_18.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
