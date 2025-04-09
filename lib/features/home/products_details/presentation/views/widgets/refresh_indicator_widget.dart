import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  const RefreshIndicatorWidget({
    super.key,
    required Future<dynamic> Function() onRefresh,
  }) : _onRefresh = onRefresh;
  final Future Function() _onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.primaryColor,
      color: Colors.white,
      onRefresh: _onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [SizedBox(height: resposiveHeight(100))],
      ),
    );
  }
}
