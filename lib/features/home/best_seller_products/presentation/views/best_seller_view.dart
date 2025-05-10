import 'package:flower_app/features/cart/presentation/cubit/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flower_app/features/home/best_seller_products/presentation/cubit/best_seller_cubit.dart';
import 'package:flower_app/features/home/best_seller_products/presentation/views/best_seller_view_body.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injectable_initializer.dart';

class BestSellerView extends StatelessWidget {
  BestSellerView({super.key});

  BestSellerViewModel bestSellerViewModel = getIt.get<BestSellerViewModel>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => bestSellerViewModel,
),
    BlocProvider(
      create: (context) => getIt.get<AddToCartCubit>(),
    ),
  ],
  child: Scaffold(
        appBar: AppBar(
          toolbarHeight: resposiveHeight(80),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).BestSellers,
                style: AppTextStyles.inter500_20.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                S.of(context).bloomwithourexquisitebestsellers,
                style: AppTextStyles.inter500_13.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
        body: BestSellerViewBody(bestSellerViewModel: bestSellerViewModel),
      ),
);
  }
}
