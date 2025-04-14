import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/body_widget.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/language_widget.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/logout_widget.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/notification_widget.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/di/injectable_initializer.dart';
import '../cubit/profile_state.dart';
import '../cubit/profile_view_model.dart';
import 'widget/profile_app_bar_widget.dart';
import 'widget/user_information_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileViewModel(getIt())..doIntent(ProfileClickedIntent()),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: resposiveWidth(16), vertical: resposiveHeight(8)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProfileAppBarWidget(),
                SizedBox(height: resposiveHeight(32)),

                BlocBuilder<ProfileViewModel, ProfileState>(
                  builder: (context, state) {
                    if (state is SuccessProfileState) {
                      return UserInformationWidget(
                        name: state.user?.firstName ?? S.of(context).guestUser,
                        email: state.user?.email ?? S.of(context).guestUser,
                        image: state.user?.photo,
                      );
                    } else if (state is LoadingProfileState) {
                      return const Center(
                        child: CircularProgressIndicator(color: AppColors.primaryColor),
                      );
                    } else if (state is ErrorProfileState) {
                      return Center(
                        child: Text(
                          state.message,
                          style: AppTextStyles.inter500_16.copyWith(color: Colors.red),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),


                 BodyWidget(text: S.of(context).myOrders, icon: Icons.list_alt),
                 BodyWidget(text: S.of(context).savedAddress, icon: Icons.location_on),
                const Divider(color: AppColors.greyColor),

                const NotificationWidget(),
                const Divider(color: AppColors.greyColor),

                const LanguageWidget(),
                 BodyWidget(text: S.of(context).aboutUs),
                 BodyWidget(text: S.of(context).termsAndConditions),
                const Divider(color: AppColors.greyColor),

                const LogoutWidget(),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: resposiveHeight(40)),
                  child: Text(
                    'v 6.3.0 - (446)',
                    style: AppTextStyles.inter400_12.copyWith(
                      color: AppColors.greyDarkColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

