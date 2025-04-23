import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key, required this.userData});
  // const UserInformationWidget({super.key,required this.name,
  //   required this.email,  this.image,});
  // final String name;
  // final String email;
  // final String? image;
  final UserEntity userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: resposiveWidth(16),
        vertical: resposiveHeight(8),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightPinkColor,
            radius: 50,
            backgroundImage:
                userData.photo == null || userData.photo!.isEmpty
                    ? AssetImage(ImageAssets.profileImage)
                    : NetworkImage(userData.photo!),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: resposiveHeight(16),
              bottom: resposiveHeight(24),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userData.firstName ?? '',
                      style: AppTextStyles.inter500_18,
                    ),
                    SizedBox(width: resposiveWidth(8)),
                    SizedBox(
                      width: resposiveWidth(24),
                      height: resposiveHeight(24),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            PagesRoutes.editProfileScreen,
                            arguments: userData,
                          );
                        },
                        child: ImageIcon(AssetImage(IconAssets.editIcon)),
                      ),
                    ),
                  ],
                ),
                Text(
                  userData.email ?? '',
                  style: AppTextStyles.inter500_18.copyWith(
                    color: AppColors.greyDarkColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
