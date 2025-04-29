import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';

class DragIndicatorBar extends StatelessWidget {
  const DragIndicatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: resposiveWidth(80),
      height: resposiveHeight(4),
      decoration: ShapeDecoration(
        color: const Color(0xFF434343),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
