import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          // backgroundImage: NetworkImage(''),
          backgroundImage: AssetImage(ImageAssets.profileImage),
        ),
        Padding(
          padding: EdgeInsets.only(top:resposiveHeight(16),bottom: resposiveHeight(24)),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name",style: AppTextStyles.inter500_18),
                  SizedBox(width: resposiveWidth(8),),
                  SizedBox(
                    width:resposiveWidth(24),
                      height: resposiveHeight(24),
                      child: ImageIcon(AssetImage(IconAssets.editIcon,),)),//I want to add width and height 24
                ],
              ),
              Text('email@gmail.com',style: AppTextStyles.inter500_18.copyWith(color: AppColors.greyDarkColor),)
            ],
          ),
        ),
      ],
    );
  }
}

