
import 'package:flutter/material.dart';

import '../../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../../core/routes_generator/pages_routes.dart';
import '../../../../../../core/services/screen_size_service.dart';
import '../../../../../../core/services/shared_preference_services.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var screenWidth;
      return AlertDialog(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LOGOUT',
            style:AppTextStyles.inter600_18),
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Confirm logout!!',

            ),
          ],
        ),
        actions: [

          OutlinedButton(
            onPressed: () {
              // Handle "Cancel" action (logout logic goes here)
              Navigator.of(context).pop();
            },
            child: Text('Cancel',
              style:  AppTextStyles.inter500_13,),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: Size(
                  resposiveWidth(100)
                  ,resposiveHeight(40)
              ),

            ),
            onPressed: () {


              Navigator.of(context).pop();
              SharedPreferenceServices.logoutUser();
              Navigator.pushNamed(context, PagesRoutes.signInScreen);

            },
            child: Text('Logout'
            , style: AppTextStyles.inter500_13,
            ),
          ),
        ],
      );
    },
  );
}