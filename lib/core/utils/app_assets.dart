const String imagePath = "assets/images";
const String iconPath = "assets/icons";
const String imagePath="assets/images";
const String iconPath="assets/icons";
const String svgPath="assets/svg";

abstract class ImageAssets{
  static const String profileImage="$imagePath/profile_example.jpg";
  static const String paymentSuccess="$imagePath/payment_success.png";
}

abstract class IconAssets {
  static const String homeIcon = "$iconPath/homeIcon.png";
  static const String profileIcon = "$iconPath/profileIcon.png";
  static const String categoryIcon = "$iconPath/categoryIcon.png";
  static const String cartIcon = "$iconPath/cartIcon.png";
  static const String LocationIcon = "$iconPath/location_icon.png";

  static const String filterIcon = "$iconPath/filterIcon.png";
  static const String deleteIcon = "$imagePath/deleteIcon.png";

  static const String notificationIcon = "$iconPath/notification_icon.png";
  static const String editIcon = "$iconPath/edit_icon.png";
  static const String markerIcon= "$iconPath/marker_icon.png";
}

abstract class SvgImages {
  static const String logo = "$imagePath/Logo.svg";
  static const String dropDownIcon = "$iconPath/drop_down_icon.svg";
  static const String locationMarker = "$iconPath/marker.svg";
abstract class SvgImages{
  static const String logo="$imagePath/Logo.svg";
  static const String deleteIcon="$svgPath/deleteIcon.svg";
}
