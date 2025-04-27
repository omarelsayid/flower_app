import 'dart:developer';

import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/orders/domain/entites/orders_response_entity.dart';
import 'package:flower_app/features/orders/presentation/cubits/get_orders_cubit/get_orders_states.dart';
import 'package:flower_app/features/orders/presentation/cubits/get_orders_cubit/get_orders_view_model.dart';
import 'package:flower_app/features/orders/presentation/views/widgets/active_order_widget.dart';
import 'package:flower_app/features/orders/presentation/views/widgets/completed_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OrdersViewBody extends StatefulWidget {
  const OrdersViewBody({super.key, required this.getOrdersViewModel});

  final GetOrdersViewModel getOrdersViewModel;

  @override
  State<OrdersViewBody> createState() => _OrdersViewBodyState();
}

class _OrdersViewBodyState extends State<OrdersViewBody> {
  List<OrderEntity> ordersActive = [];
  List<OrderEntity> ordersCompleted = [];
  @override
  void initState() {
    widget.getOrdersViewModel.getUserOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetOrdersViewModel, GetOrdersStates>(
      listener: (context, state) {
        switch (state) {
          case GetOrdersLoadingState():
            log('loading');
            EasyLoading.show();
          case GetOrdersSuccessState():
            log('success');
            EasyLoading.dismiss();
          case GetOrdersErrorState():
            log('error');
            EasyLoading.dismiss();
            EasyLoading.showError(state.error);
          default:
        }
      },
      builder: (context, state) {
        if (state is GetOrdersLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else if (state is GetOrdersSuccessState) {
          if (state.orders?.isNotEmpty == true) {
            // state.orders?[0].state = "completed";
            // state.orders?[6].state = "completed";
            state.orders?.forEach((order) {
              if (order.state == 'pending') {
                ordersActive.add(order);
              } else if (order.state == 'completed') {
                ordersCompleted.add(order);
              }
            });
            // ordersActive =
            //     state.orders!
            //         .where((order) => order.state == 'pending')
            //         .toList();
            // ordersCompleted =
            //     state.orders!
            //         .where((order) => order.state == 'completed')
            //         .toList();
          }
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                SizedBox(height: resposiveHeight(8)),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.greyColor, width: 1),
                    ),
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(
                        child: Text('Active', style: AppTextStyles.inter400_16),
                      ),
                      Tab(
                        child: Text(
                          'Completed',
                          style: AppTextStyles.inter400_16,
                        ),
                      ),
                    ],
                    labelColor: AppColors.primaryColor,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: AppTextStyles.inter400_16,
                    unselectedLabelStyle: AppTextStyles.inter400_16,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3.0,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: false,
                  ),
                ),
                SizedBox(height: resposiveHeight(8)),
                Expanded(
                  child: TabBarView(
                    children: [
                      ActiveOrderWidget(ordersActive: ordersActive),
                      CompletedOrderWidget(ordersCompleted: ordersCompleted),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
