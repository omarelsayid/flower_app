import 'package:flower_app/core/services/screen_size_service.dart';

double resposiveHeight(double height) {
  final screenHeight = ScreenSizeService.height;
  return (height / ScreenSizeService.baseHeight) * screenHeight;
}

double resposiveWidth(double width) {
  final screenWidth = ScreenSizeService.width;
  return (width / ScreenSizeService.baseWidth) * screenWidth;
}