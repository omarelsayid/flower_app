import 'package:flower_app/core/services/localization_service.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/lang_bottom_sheet_decoration_dash.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/language_tile_widget.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../../core/utils/text_styles.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: resposiveHeight(16),
        horizontal: resposiveWidth(24),
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                // margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.all(16),
                height: resposiveHeight(220),
                width: resposiveWidth(375),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  spacing: resposiveHeight(16),
                  children: [
                    DragIndicatorBar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).language,
                          style: AppTextStyles.outfit700_20.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    LanguageTileWidget(
                      title: S.of(context).english,
                      value: 'en',
                    ),
                    LanguageTileWidget(
                      title: S.of(context).arabic,
                      value: 'ar',
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Row(
          children: [
            Icon(Icons.translate, size: 16),
            SizedBox(width: resposiveWidth(8)),
            Text(S.of(context).language, style: AppTextStyles.inter500_13),
            Spacer(),
            Text(
              context.watch<LocaleProvider>().locale.languageCode == 'en'
                  ? S.of(context).english
                  : S.of(context).arabic,
              style: AppTextStyles.inter400_12.copyWith(
                fontSize: 10,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
