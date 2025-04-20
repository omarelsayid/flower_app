import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class FlowerCard extends StatelessWidget {
  FlowerCard({
    super.key,
    required this.imageUrl,
    required this.beforeDiscount,
    required this.cost,
    required this.discountRate,
    required this.name,
    required this.id,
    this.isLoading=false,
    required this.onAddToCart,
  });
  String imageUrl;
  String name;
  String cost;
  String beforeDiscount;
  String discountRate;

  bool isLoading;
  VoidCallback onAddToCart;
  String id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: resposiveWidth(8),
        vertical: resposiveHeight(8),
      ),
      // size ====>    width:  resposiveWidth(163),
      //         height:  resposiveHeight(229),
      child: SizedBox(
        width: resposiveWidth(163),
        height: resposiveHeight(229),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Color(0xFFA6A6A6),
              width: resposiveWidth(0.5),
            ),
          ),
          elevation: 0,
          color: AppColors.whiteColor,
          // color:Colors.white70,
          // elevation:6,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: resposiveWidth(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: resposiveWidth(8),
                    vertical: resposiveHeight(8),
                  ),

                  color: AppColors.whiteColor,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: resposiveWidth(147),
                    height: resposiveHeight(131),
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.lightPinkColor,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: resposiveWidth(8),
                    vertical: resposiveWidth(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.split(' ').length >= 2
                            ? '${name.split(' ')[0]} ${name.split(' ')[1]}'
                            : name,
                        style: AppTextStyles.inter400_12,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "EGP $cost",
                              style: AppTextStyles.inter400_14.copyWith(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(text: '  '),
                            TextSpan(
                              text: beforeDiscount,
                              style: AppTextStyles.inter400_12.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.blackColor,
                              ),
                            ),
                            TextSpan(text: '  '),
                            TextSpan(
                              text: discountRate,
                              style: AppTextStyles.inter400_12.copyWith(
                                color: AppColors.greenColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed:isLoading?null : onAddToCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: Size.fromHeight(resposiveHeight(40)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                    ),
                    child: isLoading?Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageIcon(
                          AssetImage(IconAssets.cartIcon),
                          size: MediaQuery.of(context).size.width * 0.04,
                          color: AppColors.whiteColor,
                        ),
                        Text(
                          "add to card",
                          style: AppTextStyles.inter400_12.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
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
