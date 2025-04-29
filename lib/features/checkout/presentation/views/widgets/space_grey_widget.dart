import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';

class SpaceGreyWidget extends StatelessWidget {
  const SpaceGreyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: resposiveHeight(12),
      color: Color(0xFFEAEAEA),
    );
  }
}
