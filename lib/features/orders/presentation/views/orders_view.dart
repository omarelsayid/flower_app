import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/orders/presentation/views/orders_view_body.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders', style: AppTextStyles.roboto500_18),
      ),
      body: OrdersViewBody(),
    );
  }
}
