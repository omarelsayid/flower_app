import 'dart:io';

import 'package:flower_app/features/cart/presentation/cubit/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flower_app/features/home/categories/presentation/manager/categories_state.dart';
import 'package:flower_app/features/home/categories/presentation/manager/categories_view_model.dart';
import 'package:flower_app/features/home/categories/presentation/widget/custom_search_categories.dart';
import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/widgets/custom_diaolg.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/flower_card.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<CategoriesViewModel>();
    final height = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (_) => viewModel..doIntent(GetAllCategoriesIntent()),
),
    BlocProvider(
      create: (context) => getIt.get<AddToCartCubit>(),
    ),
  ],
  child: BlocConsumer<CategoriesViewModel, CategoriesState>(
        listener: (context, state) {
          if (state is CategoriesErrorState ||
              state is SpecificCategoriesErrorState) {
            DialogUtils.showMessage(
              context: context,
              message:
                  (state is CategoriesErrorState)
                      ? state.errMessage
                      : (state as SpecificCategoriesErrorState).errMessage,
              title: "Error",
              negativeActionName: "Cancel",
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height * 0.05),
                CustomSearchCategories(
                  onChanged: (value) {
                    if (value.trim().isNotEmpty) {
                      viewModel.doIntent(SearchIntent(value.trim()));
                    } else {
                      viewModel.doIntent(GetAllCategoriesIntent());
                    }
                  },
                ),
                SizedBox(height: height * 0.015),

                if (state is CategoriesLoadingState)
                  const Center(child: CircularProgressIndicator())
                else if (viewModel.categories.isNotEmpty)
                  DefaultTabController(
                    length: viewModel.categories.length,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          onTap: (index) {
                            viewModel.doIntent(
                              ChangeCategoriesIndexIntent(index),
                            );
                          },
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          labelColor: AppColors.primaryColor,
                          unselectedLabelColor: AppColors.greyColor,
                          indicatorColor: AppColors.primaryColor,
                          tabs:
                              viewModel.categories
                                  .map((category) => Tab(text: category.name))
                                  .toList(),
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: height * 0.02),

                if (state is LoadingSearchState ||
                    state is SpecificCategoriesLoadingState)
                  Skeletonizer(
                    enabled: true,
                    containersColor: AppColors.whiteColor,
                    child: _buildProductsList([], 5),
                  )
                else if (state is SuccessfulSearchState &&
                    viewModel.isSearching)
                  state.products.isNotEmpty
                      ? _buildProductsList(
                        state.products,
                        state.products.length,
                      )
                      : const Center(child: Text("No products found"))
                else if (state is SpecificCategoriesSuccessState &&
                    state.products.isNotEmpty &&
                    !viewModel.isSearching)
                  _buildProductsList(state.products, state.products.length)
                else
                  const Center(child: Text("No products found")),
              ],
            ),
          );
        },
      ),
);
  }

  Widget _buildProductsList(List products, int length) {
    if (products.isEmpty || length == 0) {
      return const Center(child: Text("No products available"));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: resposiveHeight(1),
        mainAxisSpacing: resposiveWidth(1),
        childAspectRatio: 0.7,
      ),
      itemCount: length,
      itemBuilder: (context, index) {
        if (index >= products.length) {
          return const SizedBox();
        }

        final product = products[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              PagesRoutes.productDetails,
              arguments: product.id,
            );
          },
          child: BlocConsumer<AddToCartCubit, AddToCartState>(
  listener: (context, state) {
      if(state is AddToCartSuccess && state.id==product.id)
        {
          EasyLoading.showSuccess(state.message);
        }
      else if(state is AddToCartError && state.id == product.id)
        {
          EasyLoading.showError(state.error);
        }

  },
  builder: (context, state) {
    final isLoading = state is AddToCartLoading && state.id==product.id;
    return FlowerCard(
            name: product.title.toString(),
            beforeDiscount: "${product.discount}",
            discountRate: "${product.priceAfterDiscount}%",
            cost: '${product.price}',
            imageUrl: '${product.imgCover}',
           id: "${product.id}",
      isLoading: isLoading,
      onAddToCart:() {
        context.read<AddToCartCubit>().AddToCart(productId:product.id , quantity: 1);
      },
          );
  },
),
        );
      },
    );
  }
}
