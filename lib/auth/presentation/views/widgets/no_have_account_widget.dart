import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class NoHaveAccountWidget extends StatelessWidget {
  const NoHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?', style: AppTextStyles.inter400_14),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, PagesRoutes.signUpScreen);
          },
          child: Text(
            'Sign up',
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
