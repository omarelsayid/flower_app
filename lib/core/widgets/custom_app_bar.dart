import 'package:flower_app/core/services/screen_size_service.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildCustomAppBar({
  required String title,
  required bool isVisible,
  bool? isCenterTitle,
  List<Widget>? actions,
  required BuildContext context,
}) {
  return AppBar(
    centerTitle: isCenterTitle,
    actions: actions,
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    titleSpacing: (2 / ScreenSizeService.baseWidth) * ScreenSizeService.width,
    leading:
        isVisible
            ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            )
            : null, // Set leading to null if isVisible is false
    title: Text(title, style: AppTextStyles.inter500_20),
  );
}
