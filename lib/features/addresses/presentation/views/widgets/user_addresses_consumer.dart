import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../cubit/user_addresses_cubit/user_addresses_state.dart';
import '../../cubit/user_addresses_cubit/user_addresses_view_model.dart';

class UserAddressesConsumer extends StatelessWidget {
  const UserAddressesConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAddressesViewModel, UserAddressesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingUserAddressesState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorUserAddressesState) {
          return Center(child: Text(state.message.toString()));
        } else if (state is SuccessUserAddressesState) {
          final addresses = state.data;
          final deletingId = state.deletingId;

          final itemCount = addresses.isEmpty ? 2 : addresses.length + 1;

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemCount: itemCount,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (addresses.isEmpty) {
                if (index == 0) {
                  return  Center(child: Text(S.of(context).no_address_found));
                } else {
                  return _buildAddButton(context);
                }
              }

              if (index < addresses.length) {
                final address = addresses[index];
                final isDeleting = deletingId == address.id;

                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PagesRoutes.userAddressesDetailsScreen,arguments: address);

                  },
                  child:
                  Card(
                    color: AppColors.whiteColor,
                    child: SizedBox(
                      width: resposiveWidth(343),
                      height: resposiveHeight(83),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: resposiveHeight(12),
                          horizontal: resposiveWidth(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: resposiveHeight(2),
                                  ),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: resposiveWidth(20),
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                SizedBox(width: resposiveWidth(8)),
                                Text(
                                  address.city ?? '',
                                  style: AppTextStyles.inter500_16.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                                ),

                                Spacer(),

                                if (isDeleting)
                                  SizedBox(
                                    width: resposiveWidth(24),
                                    height: resposiveHeight(24),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.primaryColor,
                                    ),
                                  )
                                else ...[
                                  InkWell(
                                    child:
                                    // ImageIcon(AssetImage(IconAssets.deleteIcon), color: AppColors.errorLightColor,),
                                    SvgPicture.asset(
                                      SvgImages.deleteIcon,
                                      width: resposiveWidth(24),
                                      height: resposiveHeight(24),
                                      //color: Colors.red,
                                    ),
                                    onTap:
                                        () => context
                                            .read<UserAddressesViewModel>()
                                            .doIntent(
                                              DeleteUserAddressClickedIntent(
                                                address.id!,
                                              ),
                                            ),
                                  ),
                                ],
                                SizedBox(width: resposiveWidth(2),),
                                InkWell(
                                  child: Icon(
                                    Icons.edit,
                                    color: AppColors.greyDarkColor,
                                    size: 20,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                            SizedBox(height: resposiveHeight(4)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: resposiveWidth(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    address.lat ?? '',
                                    style: AppTextStyles.inter500_13.copyWith(
                                      color: AppColors.greyDarkColor,
                                    ),
                                  ),
                                  Text(
                                    "+${address.long ?? ''} ",
                                    style: AppTextStyles.inter500_13.copyWith(
                                      color: AppColors.greyDarkColor,
                                    ),
                                  ),
                                  Text(
                                    "- ${address.street ?? ''}",
                                    style: AppTextStyles.inter500_13.copyWith(
                                      color: AppColors.greyDarkColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }

              return _buildAddButton(context);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        S.of(context).add_new_addresses,
        style: AppTextStyles.inter500_18.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
