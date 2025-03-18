import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return ThemeData(scaffoldBackgroundColor: Colors.white);
}
