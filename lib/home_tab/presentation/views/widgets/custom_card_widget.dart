import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
   CustomCardWidget({super.key, required this.imgUrl, required this.name,  this.price});
   String imgUrl;
  final String name;
  final double ?price;

  @override
  Widget build(BuildContext context) {
    if(!imgUrl.contains("http")){
      imgUrl="https://flower.elevateegy.com/uploads/"+imgUrl;
    }
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: resposiveWidth(131),
            height: resposiveHeight(151),
            child: Image.network(imgUrl,fit: BoxFit.cover,),
          ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name text with ellipsis if too long
          Text(
            name,
            style: AppTextStyles.inter400_12,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          // Price text
          (price==null)?SizedBox.shrink(): Text(
            "$price EGP",
            style: AppTextStyles.inter500_14.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
        ],
      ),
    );
  }
}
