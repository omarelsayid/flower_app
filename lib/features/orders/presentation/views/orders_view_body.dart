import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                Tab(child: Text('Active', style: AppTextStyles.inter400_16)),
                Tab(child: Text('Completed', style: AppTextStyles.inter400_16)),
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
                Center(child: Text('Active Orders')),
                Center(child: Text('Completed Orders')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
