import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_icons.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final bool isDeleting;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onTap;

  const AddressCard({
    required this.address,
    required this.isDeleting,
    required this.onDelete,
    required this.onEdit,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
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
                      padding: EdgeInsets.only(top: resposiveHeight(2)),
                      child: Icon(
                        AppIcons.location,
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
                            strokeWidth:2
                        ),
                      )
                    else ...[
                      InkWell(
                        onTap: onDelete,
                        child: SvgPicture.asset(
                          SvgImages.deleteIcon,
                          width: resposiveWidth(24),
                          height: resposiveHeight(24),
                        ),
                      ),
                    ],
                    SizedBox(width: resposiveWidth(2)),
                    InkWell(
                      onTap: onEdit,
                      child: Icon(
                        AppIcons.edit,
                        color: AppColors.greyDarkColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: resposiveHeight(4)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: resposiveWidth(8)),
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
}
