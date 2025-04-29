import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../../core/utils/app_assets.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: resposiveWidth(16),
        vertical: resposiveHeight(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(SvgImages.logo),
          SizedBox(width: resposiveWidth(16)),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, PagesRoutes.notificationScreen);
              },
              child: ImageIcon(AssetImage(IconAssets.notificationIcon,),size: 24,)),//I want to add width and height 24
        ],
      ),
    );
  }
}
