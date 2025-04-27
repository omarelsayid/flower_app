import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/orders/presentation/cubits/get_orders_cubit/get_orders_view_model.dart';
import 'package:flower_app/features/orders/presentation/views/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersView extends StatelessWidget {
  OrdersView({super.key});

  GetOrdersViewModel getOrdersViewModel = getIt.get<GetOrdersViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getOrdersViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Orders', style: AppTextStyles.roboto500_18),
        ),
        body: OrdersViewBody(
            getOrdersViewModel:getOrdersViewModel
        ),
      ),
    );
  }
}
