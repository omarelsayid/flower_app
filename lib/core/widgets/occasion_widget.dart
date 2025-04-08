import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';
import 'flower_card.dart';

class OccasionWidget extends StatelessWidget {
  const OccasionWidget({super.key, required this.flowers});

  final List<Map<String, String>> flowers;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView.builder(
        shrinkWrap: true, // Fixes overflow issue in Column
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: resposiveWidth(8), vertical: resposiveHeight(2)),
        itemCount: flowers.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: resposiveWidth(50),
            height: resposiveHeight(260),
            child: FlowerCard(
              name: flowers[index]["name"]!,
              beforeDiscount: flowers[index]["discount"]!,
              discountRate: flowers[index]["discountRate"]!,
              cost: flowers[index]["cost"]!,
              imageUrl: flowers[index]["imageUrl"]!,
            ),
          );
        },


      ),
    );
  }
}

