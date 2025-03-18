import 'package:flutter/material.dart';

double getResponsiveFontSize(BuildContext context, double baseSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor =
      screenWidth / 375; // 375 is the reference width (e.g., iPhone X)
  return baseSize * scaleFactor;
}
