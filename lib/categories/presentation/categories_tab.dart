import 'package:flower_app/categories/presentation/manager/categories_state.dart';
import 'package:flower_app/categories/presentation/manager/categories_view_model.dart';
import 'package:flower_app/categories/presentation/widget/custom_search_categories.dart';
import 'package:flower_app/core/widgets/custom_diaolg.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/get_resposive_height_and_width.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/flower_card.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<CategoriesViewModel>();
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => viewModel..doIntent(GetAllCategoriesIntent()),
      child: BlocConsumer<CategoriesViewModel, CategoriesState>(
        listener: (context, state) {
          if (state is CategoriesErrorState ||
              state is SpecificCategoriesErrorState) {
            DialogUtils.showMessage(
              context: context,
              message: (state is CategoriesErrorState)
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

                // Category Tabs
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
                                ChangeCategoriesIndexIntent(index));
                          },
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          labelColor: AppColors.primaryColor,
                          unselectedLabelColor: AppColors.greyColor,
                          indicatorColor: AppColors.primaryColor,
                          tabs: viewModel.categories
                              .map((category) => Tab(text: category.name))
                              .toList(),
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: height * 0.02),

                // Products Display
                if (state is LoadingSearchState ||
                    state is SpecificCategoriesLoadingState)
                  const Center(child: CircularProgressIndicator())
                else if (state is SuccessfulSearchState &&
                    viewModel.isSearching)

                      state.products.isNotEmpty
                      ? _buildProductsList(state.products)
                      : const Center(child: Text("No products found"))

                else if (state is SpecificCategoriesSuccessState &&
                      state.products.isNotEmpty &&
                      !viewModel.isSearching)
                    _buildProductsList(state.products)

                  else
                    const Center(child: Text("No products found")),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductsList(List products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: resposiveHeight(1), // Add spacing between columns
        mainAxisSpacing: resposiveWidth(1),  // Add spacing between rows
        childAspectRatio: 0.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return FlowerCard(
          name: product.title.toString(),
          beforeDiscount: "${product.discount}",
          discountRate: "${product.priceAfterDiscount}%",
          cost: '${product.price}',
          imageUrl: '${product.imgCover}',
        );
      },
    );
    // return ListView.builder(
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: products.length,
    //   itemBuilder: (context, index) {
    //     return Card(
    //       child: ListTile(
    //         title: Text(products[index].title ?? ''),
    //       ),
    //     );
    //   },
    // );
  }
}
