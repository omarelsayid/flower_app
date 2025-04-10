
import 'package:flutter/material.dart';

import '../../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../../core/services/screen_size_service.dart';
import '../../../../../../core/utils/app_colors.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var screenWidth;
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LOGOUT'),
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Confirm logout!!'),
          ],
        ),
        actions: [

          OutlinedButton(
            onPressed: () {
              // Handle "Cancel" action (logout logic goes here)
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
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
              // Handle "Logout" action
              Navigator.of(context).pop();
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}