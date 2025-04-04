import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/services/shared_preference_services.dart';
import '../../../core/utils/constans.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kVerticalHPadding,
        ),
        child: Column(
          children: [
            // build search bar
            Row(
              children: [
                SvgPicture.asset(SvgImages.logo),
                SizedBox(width: 17),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: AppTextStyles.inter400_14.copyWith(
                        color: AppColors.greyColor,
                      ),
                      prefix: Icon(Icons.search, color: AppColors.greyColor),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                // Search bar
              ],
            ), // logo
            // address
            Padding(
              padding: EdgeInsets.symmetric(vertical: kVerticalHPadding),
              child: Row(
                children: [
                  Image.asset(IconAssets.LocationIcon),
                  Text(
                    " Deliver to 2XVP+XC - Sheikh Zayed",
                    style: AppTextStyles.inter400_14,
                  ),
                  IconButton(
                    onPressed: () async{

                      print(await SharedPreferenceServices.getData(AppConstants.token));
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 35,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            // category
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: AppTextStyles.inter500_18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},

                      child: Text(
                        "View all",

                        style: AppTextStyles.inter600_12.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
