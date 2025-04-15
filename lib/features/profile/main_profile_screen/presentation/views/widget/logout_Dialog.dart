import 'dart:developer';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/get_resposive_height_and_width.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../cubit/profile_view_model.dart';

void showLogoutDialog(BuildContext parentContext) {
  showDialog(
    context: parentContext,
    builder: (BuildContext context) {
      return Builder(
        builder: (innerContext) {
          return AlertDialog(
            title: SizedBox(
              height: resposiveHeight(50),
                child: Center(child: Text('LOGOUT'))
            ),
            content: SizedBox(
              height: resposiveHeight(40),
              child: Center(
                 
                  child: Text('Confirm logout!!')
              ),
            ),
            actions: [
              SizedBox(
                height: resposiveHeight(50),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(innerContext).pop();
                  },
                  child: Text('Cancel',
                      style: AppTextStyles.inter500_14.copyWith(color: AppColors.blackColor)),
                ),
              ),
              
              SizedBox(
                height: resposiveHeight(50),
                child: ElevatedButton(
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
                
                    log("true++++++");
                  },
                  child: Text('Logout',
                   style: AppTextStyles.inter500_14.copyWith(color: AppColors.whiteColor),),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
