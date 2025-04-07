import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/constans.dart';

class FlowerCard extends StatelessWidget {
   FlowerCard({super.key, required this.imageUrl,required this.beforDiscount,required this.cost,required this.discountRate,required this.name});
   String imageUrl;
   String name ;
   String cost ;
   String beforDiscount ;
   String discountRate;

   @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  MediaQuery.of(context).size.width*0.43,
      height:  MediaQuery.of(context).size.height*0.268,
      child: Card(

        color:AppColors.whiteColor,
       // elevation:6,
          child: Padding(
            padding:  EdgeInsets.symmetric( horizontal: kHorizontalPadding*0.5,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  SizedBox(
                   width:  MediaQuery.of(context).size.width*0.4,
                  height:  MediaQuery.of(context).size.height*0.18,
                    child:   CachedNetworkImage(
                      imageUrl: imageUrl,

                    )
                  ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric( horizontal: kHorizontalPadding*0.5, ),
                  child: Row(

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            //textAlign: TextAlign.start,
                          ),
                          RichText(

                            text: TextSpan(

                              children: [
                                TextSpan(
                                    text: cost,
                                style:  TextStyle(

                                    fontSize: 14,
                                    fontWeight: FontWeight.w500, color: AppColors.blackColor)
                                ),
                                TextSpan(
                                  text: '  '
                                ),

                                TextSpan(
                                  text: beforDiscount,
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
