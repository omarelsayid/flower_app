
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constans.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.imgUrl, required this.name});
  final String imgUrl;
  final String name;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            width: 70,
            height: 65,

            decoration: BoxDecoration(
              color:AppColors.lightPink,
              borderRadius: BorderRadius.circular(20)
            ),


            child:Image.network(imgUrl,width: 25,),
          ),
          SizedBox(height: 8,),
          Text(name,style: AppTextStyles.inter400_14,)
        ],
      ),
    );
  }
}
