import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key,required this.name,
    required this.email,  this.image,});
  final String name;
  final String email;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.lightPinkColor,
          radius: 50,
          backgroundImage: image == null || image!.isEmpty
              ? AssetImage(ImageAssets.profileImage)
              : NetworkImage(image!),
        ),
        Padding(
          padding: EdgeInsets.only(top:resposiveHeight(16),bottom: resposiveHeight(24)),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,style: AppTextStyles.inter500_18),
                  SizedBox(width: resposiveWidth(8),),
                  SizedBox(
                    width:resposiveWidth(24),
                      height: resposiveHeight(24),
                      child: ImageIcon(AssetImage(IconAssets.editIcon,),)),
                ],
              ),
              Text(email,style: AppTextStyles.inter500_18.copyWith(color: AppColors.greyDarkColor),)
            ],
          ),
        ),
      ],
    );
  }
}

