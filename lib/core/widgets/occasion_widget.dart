//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constans.dart';
import 'flower_card.dart';
 List<Map<String, String>> flowers = [
  {"name": "Rose", "discount": "Spring Sale", "discountRate": "20%", "cost": ''},
  {"name": "Lily", "discount": "Summer Sale", "discountRate": "15%", "cost": ''},
  {"name": "Tulip", "discount": "Winter Sale", "discountRate": "25%", "cost": ''},
  {"name": "Sunflower", "discount": "Autumn Sale", "discountRate": "30%", "cost": ''},
  {"name": "Rose", "discount": "Spring Sale", "discountRate": "20%", "cost": ''},
  {"name": "Lily", "discount": "Summer Sale", "discountRate": "15%", "cost": ''},
  {"name": "Tulip", "discount": "Winter Sale", "discountRate": "25%", "cost": ''},
  {"name": "Sunflower", "discount": "Autumn Sale", "discountRate": "30%", "cost": ''},
];
class OccasionWidget extends StatelessWidget {

    const OccasionWidget({super.key,required this.flowers});
  final List<Map<String, String>> flowers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Expanded(
          child: GridView.builder(
            shrinkWrap: true, // Fixes overflow issue in Column
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric( horizontal: kHorizontalPadding*0.5, vertical: kVerticalHPadding*0.5 ) ,
            itemCount: flowers.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width:  MediaQuery.of(context).size.width*0.43,
                height:  MediaQuery.of(context).size.height*0.268,
                child: FlowerCard(
                  name: flowers[index]["name"]!,
                  discount: flowers[index]["discount"]!,
                  discountRate: flowers[index]["discountRate"]!,
                  cost: flowers[index]["cost"]!,
                  imageUrl: '',
                  // Example image
                ),
              );
            },
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8, // Add spacing between columns
            mainAxisSpacing: 8,  // Add spacing between rows
            childAspectRatio: 0.7, // Adjust item ratio to avoid overflow
          ),
          ),
        ),
      ],
    );
  }
}
