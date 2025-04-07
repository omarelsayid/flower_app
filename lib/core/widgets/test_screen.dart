import 'package:flutter/material.dart';

import 'flower_card.dart';
import 'occasion_widget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
         body:Expanded(child: OccasionWidget( flowers:[
           {"name":"rose", "discount": "800", "discountRate": "20%", "cost": '500'},
           {"name": "Lily", "discount": "500", "discountRate": "15%", "cost": '10000'},
           {"name": "Tulip", "discount": "70000", "discountRate": "25%", "cost": '500'},
           {"name": "Rose", "discount": "800", "discountRate": "20%", "cost": '500'},
           {"name": "Lily", "discount": "500", "discountRate": "15%", "cost": '10000'},
           {"name": "Tulip", "discount": "70000", "discountRate": "25%", "cost": '500'},
         ],)),
    );
  }
}
