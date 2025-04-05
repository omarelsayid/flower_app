import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key, required this.imgUrl, required this.name,  this.price});
  final String imgUrl;
  final String name;
  final double ?price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 150,
            child: Image.network(imgUrl),
          ),

      Container(
        width: 130,
        height: 100, // Adjust the height as needed
        child: Column(
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
            Text(
              "$price EGP",
              style: AppTextStyles.inter500_14.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
