import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class NoHaveAccountWidget extends StatelessWidget {
  const NoHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).noAccount, style: AppTextStyles.inter400_14),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, PagesRoutes.signUpScreen);
          },
          child: Text(
            S.of(context).signUp,
            style: AppTextStyles.inter500_16.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
              decorationThickness: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
