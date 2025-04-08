import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_styles.dart';
import '../../../di/injectable_initializer.dart';
import '../manager/categories_view_model.dart';

class CustomSearchCategories extends StatelessWidget {
   CustomSearchCategories({super.key,this.onChanged});
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:resposiveHeight(8),horizontal: resposiveWidth(16)),
      child: Row(
      
        children: [
          SizedBox(
            width:resposiveWidth(271) ,
            height:resposiveHeight(48) ,
            child: TextFormField(
              keyboardType: TextInputType.name,
      
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: AppTextStyles.inter400_14.copyWith(
                  color: AppColors.greyColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.search, color: AppColors.greyColor),
              ),
            ),
          ),
          SizedBox(width: resposiveWidth(8),),
          SizedBox(
            width: resposiveWidth(64),
            height:  resposiveHeight(48),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(resposiveWidth(64), resposiveHeight(48)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: ImageIcon(AssetImage(IconAssets.filterIcon)),
            ),
          ),
        ],
      ),
    );
  }
}
