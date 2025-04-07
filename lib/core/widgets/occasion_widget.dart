//import 'package:flutter/cupertino.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flutter/material.dart';

import '../services/screen_size_service.dart';
import '../utils/constans.dart';
import 'flower_card.dart';

class OccasionWidget extends StatelessWidget {
  const OccasionWidget({super.key, required this.flowers});

  final List<Map<String, String>> flowers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Fixes overflow issue in Column
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: resposiveWidth(12), vertical: resposiveHeight(2)),
      itemCount: flowers.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: resposiveWidth(50),
          height: resposiveHeight(300),
          child: FlowerCard(
            name: flowers[index]["name"]!,
            beforeDiscount: flowers[index]["discount"]!,
            discountRate: flowers[index]["discountRate"]!,
            cost: flowers[index]["cost"]!,
            imageUrl: flowers[index]["imageUrl"]!, // Example image
          ),
        );
      },


    );
  }
}

