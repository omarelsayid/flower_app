import 'package:flutter/material.dart';

import 'flower_card.dart';
import 'occasion_widget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
         body:Expanded(child: OccasionWidget( flowers: [
         {"name": "Rose", "discount": "Spring Sale", "discountRate": "20%", "cost": ''},
         {"name": "Lily", "discount": "Summer Sale", "discountRate": "15%", "cost": ''},
         {"name": "Tulip", "discount": "Winter Sale", "discountRate": "25%", "cost": ''},
         {"name": "Sunflower", "discount": "Autumn Sale", "discountRate": "30%", "cost": ''},
         {"name": "Rose", "discount": "Spring Sale", "discountRate": "20%", "cost": ''},
         {"name": "Lily", "discount": "Summer Sale", "discountRate": "15%", "cost": ''},
         {"name": "Tulip", "discount": "Winter Sale", "discountRate": "25%", "cost": ''},
         {"name": "Sunflower", "discount": "Autumn Sale", "discountRate": "30%", "cost": ''},
         ],)),
    );
  }
}
