import 'package:flutter/material.dart';

abstract class ScreenSizeService {
  static late double width;
  static late double height;
  static const baseWidth = 375.0;
  static const baseHeight = 812.0;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
