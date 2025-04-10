import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class LanguageTileWidget extends StatelessWidget {
  final String title;
  final String value;

  const LanguageTileWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: resposiveHeight(56),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: RadioListTile<String>(
        value: value,
        groupValue: context.locale.languageCode,
        onChanged: (val) async {
          // context.setLocale(Locale(value));
          // await SharedPreferenceServices.saveData(
          //   AppConstants.locale,
          //   context.locale.languageCode,
          // );
        },
        title: Text(
          title,
          style: AppTextStyles.outfitMedium_16.copyWith(color: Colors.black),
        ),
        activeColor: AppColors.primaryColor,
        contentPadding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.transparent,
      ),
    );
  }
}
