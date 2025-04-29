import 'dart:developer';

import 'package:flower_app/features/home/best_seller_products/data/model/ProductModel.dart';
import 'package:flower_app/features/home/best_seller_products/presentation/cubit/best_seller_cubit.dart';
import 'package:flower_app/features/home/best_seller_products/presentation/cubit/best_seller_state.dart';
import 'package:flower_app/features/home/best_seller_products/presentation/views/widgets/build_grid_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerViewBody extends StatefulWidget {
  const BestSellerViewBody({super.key, required this.bestSellerViewModel});

  final BestSellerViewModel bestSellerViewModel;

  @override
  State<BestSellerViewBody> createState() => _BestSellerViewBodyState();
}

class _BestSellerViewBodyState extends State<BestSellerViewBody> {
  @override
  void initState() {
    widget.bestSellerViewModel.getBestSeller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestSellerViewModel, BestSellerState>(
      listener: (context, state) {
        if (state is BestSellerErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        switch (state) {
          case BestSellerLoadingState():
            log('Loading widget');
            return Skeletonizer(
              child: BuildGridItems(products: _dummyDataProducts()),
            );

          case BestSellerSuccessState():
            log('Success widget');
            return BuildGridItems(products: state.products);

          case BestSellerErrorState():
            log('Error widget');
            return Center(child: Text(state.error));

          default:
            return Container();
        }
      },
    );
  }

  List<ProductModel> _dummyDataProducts() {
    return List.generate(
      10,
      (index) => ProductModel(
        id: index.toString(),
        title: 'Product ',
        slug: 'product-',
        description: 'Description for product ',
        imgCover: 'https://example.com/image.jpg',
        images: [
          'https://example.com/image-1.jpg',
          'https://example.com/image-2.jpg',
        ],
        price: 100.0 + index,
        priceAfterDiscount: 90.0 + index,
        quantity: 10 + index,
        category: 'Category $index',
        occasion: 'Occasion $index',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        v: index,
        discount: 10.0,
        sold: index * 2,
        rateAvg: 4.5,
        rateCount: 10 + index,
      ),
    );
  }
}
