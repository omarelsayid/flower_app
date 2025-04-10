import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/body_widget.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/language_widget.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/logout_widget.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import 'widget/profile_app_bar_widget.dart';
import 'widget/user_information_widget.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: resposiveWidth(16),vertical: resposiveHeight(8)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileAppBarWidget(),
              SizedBox(height: resposiveHeight(32),),
              UserInformationWidget(),

              BodyWidget(text: 'My orders',icon: Icons.list_alt,),
              BodyWidget(text: 'Saved address',icon: Icons.location_on,),
              Divider(color: AppColors.greyColor,),

              NotificationWidget(),
              Divider(color: AppColors.greyColor,),

              LanguageWidget(),
              BodyWidget(text: 'About us',),
              BodyWidget(text: 'Terms & conditions',),
              Divider(color: AppColors.greyColor,),

              LogoutWidget(),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: resposiveHeight(40)),
                child: Text('v 6.3.0 - (446)',style: AppTextStyles.inter400_12.copyWith(color: AppColors.greyDarkColor),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
