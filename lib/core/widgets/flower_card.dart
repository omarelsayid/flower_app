import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/constans.dart';

class FlowerCard extends StatelessWidget {
   FlowerCard({super.key, required this.imageUrl,required this.beforeDiscount,required this.cost,required this.discountRate,required this.name});
   String imageUrl;
   String name ;
   String cost ;
   String beforeDiscount ;
   String discountRate;

   @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  resposiveWidth(163),
      height:  resposiveHeight(229),
      child: Card(

        color:AppColors.whiteColor,
       // elevation:6,
          child: Padding(
            padding:  EdgeInsets.symmetric( horizontal: resposiveWidth(4),),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: resposiveWidth(8),vertical: resposiveHeight(8)),
                  color: AppColors.lightPinkColor,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width:resposiveWidth(147),
                    height:  resposiveHeight(131),
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
                  padding:  EdgeInsets.symmetric( horizontal: 4, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Column(
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
                                style:  AppTextStyles.inter400_14.copyWith(color: AppColors.blackColor,fontWeight: FontWeight.w500)
                                ),
                                TextSpan(
                                  text: '  '
                                ),

                                TextSpan(
                                  text: beforeDiscount,
                                    style:  TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400, color: AppColors.blackColor)
                                ),
                                TextSpan(
                                    text: '  '
                                ),
                                TextSpan(
                                    text: discountRate,
                                    style:  TextStyle(

                                        fontSize: 12,
                                        fontWeight: FontWeight.w400, color: AppColors.greenColor)
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Row(
                //   children: [
                //    Text('EGP 600',
                //    style: TextStyle(
                //      fontSize: 14,
                //    ),
                //    )
                //   ],
                // ),
                SizedBox(
                  height:  MediaQuery.of(context).size.height*0.04,
                  child: ElevatedButton(onPressed: ()
                  {/* add to caRD FUNCTION*/},
                      style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,

                      shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width* 0.15),
                      ),
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           ImageIcon(
                             AssetImage(IconAssets.cartIcon),
                             size:  MediaQuery.of(context).size.width*0.04,
                             color: AppColors.whiteColor,
                           ),
                          Text(  "add to card"  ,
                            style: TextStyle(
                              color:AppColors.whiteColor ,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                            ),
                          )

                        ],
                      ),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
