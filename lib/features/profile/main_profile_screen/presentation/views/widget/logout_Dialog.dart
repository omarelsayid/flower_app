


import 'dart:developer';

import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../../core/services/screen_size_service.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../cubit/profile_view_model.dart';

void showLogoutDialog(BuildContext parentContext) {
  showDialog(
    context: parentContext,
    builder: (BuildContext context) {
      return Builder(
        builder: (innerContext) {
          return AlertDialog(
            title: Center(child: Text('LOGOUT')),
            content: Center(child: Text('Confirm logout!!')),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(innerContext).pop();
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: Size(
                    resposiveWidth(100),
                    resposiveHeight(40),
                  ),
                ),
                onPressed: () {
                  Navigator.of(innerContext).pop();  // Close dialog
                  BlocProvider.of<ProfileViewModel>(parentContext).doIntent(LogoutClickedIntent());
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   PagesRoutes.signInScreen,
                  //       (route) => false, // removes all previous routes
                  // );
                  log("true++++++");
                },
                child: Text('Logout'),
              ),
            ],
          );
        },
      );
    },
  );
}
