import 'package:flower_app/core/routes_generator/pages_routes.dart';
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
      create:
          (context) =>
              ProfileViewModel(getIt())..doIntent(ProfileClickedIntent()),
      child: SafeArea(
        child: BlocBuilder<ProfileViewModel, ProfileState>(
          builder: (context, state) {
            if (state is LoadingProfileState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (state is ErrorProfileState) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.inter500_16.copyWith(
                    color: Colors.red,
                  ),
                ),
              );
            } else if (state is SuccessProfileState) {
              final isGuest = state.user?.email == 'guest@gmail.com';
              // as guest user
              if (isGuest) {
                return Column(
                  children: [
                    const ProfileAppBarWidget(),
                    SizedBox(height: resposiveHeight(32)),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Center(
                          child: Text(
                            'Please Log in',
                            style: AppTextStyles.inter500_16,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              PagesRoutes.signInScreen,
                            );
                          },
                          child: Text(
                            S.of(context).login,
                            style: AppTextStyles.inter400_14.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                );
              }

              // as user
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const ProfileAppBarWidget(),
                    SizedBox(height: resposiveHeight(32)),
                    UserInformationWidget(
                      name: state.user?.firstName ?? '',
                      email: state.user?.email ?? '',
                      image: state.user?.photo,
                    ),
                    BodyWidget(
                      text: S.of(context).myOrders,
                      icon: Icons.list_alt_outlined,
                    ),
                    BodyWidget(
                      text: S.of(context).savedAddress,
                      icon: Icons.place_outlined,
                    ),
                    const Divider(color: AppColors.greyColor),
                    const NotificationWidget(),
                    const Divider(color: AppColors.greyColor),
                    const LanguageWidget(),
                    BodyWidget(text: S.of(context).aboutUs,onTap: (){print("object");},),
                    BodyWidget(text: S.of(context).termsAndConditions),
                    const Divider(color: AppColors.greyColor),
                    const LogoutWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: resposiveHeight(40),
                      ),
                      child: Text(
                        'v 6.3.0 - (446)',
                        style: AppTextStyles.inter400_12.copyWith(
                          color: AppColors.greyDarkColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
