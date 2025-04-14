import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/generated/l10n.dart';

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
                child: Center(child: Text(S.of(parentContext).logout,))
            ),
            content: SizedBox(
              height: resposiveHeight(40),
              child: Center(
                 
                  child: Text(  S.of(parentContext).confirmLogout,)
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: resposiveHeight(50),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(innerContext).pop();
                      },
                      child: Text(
                        S.of(parentContext).cancel,
                        style: AppTextStyles.inter500_14.copyWith(color: AppColors.blackColor),
                      ),
                    ),
                  ),
                  SizedBox(width: resposiveWidth(16)),
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
                        Navigator.of(innerContext).pop();
                        BlocProvider.of<ProfileViewModel>(parentContext).doIntent(LogoutClickedIntent());
                      },
                      child: Text(
                        S.of(parentContext).logout,
                        style: AppTextStyles.inter500_14.copyWith(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                ],
              )
            ],

          );
        },
      );
    },
  );
}
