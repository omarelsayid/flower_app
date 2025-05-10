import 'dart:io';

import 'package:flower_app/features/cart/presentation/cubit/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flower_app/features/home/categories/presentation/manager/categories_state.dart';
import 'package:flower_app/features/home/categories/presentation/manager/categories_view_model.dart';
import 'package:flower_app/features/home/categories/presentation/widget/custom_search_categories.dart';
import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/widgets/custom_diaolg.dart';
import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/features/home/categories/presentation/widget/drower_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constans.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/flower_card.dart';
import '../../../../generated/l10n.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  // bool lower_price = false;
  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<CategoriesViewModel>();
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=> getIt.get<AddToCartCubit>()),
          BlocProvider(
            create: (_) => viewModel..doIntent(GetAllCategoriesIntent()),
          ),
        ],
        child: BlocConsumer<CategoriesViewModel, CategoriesState>(
          listener: (context, state) {
            if (state is CategoriesErrorState ||
                state is SpecificCategoriesErrorState ||
                state is FailedFilterState) {
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: resposiveHeight(8),
                      horizontal: resposiveWidth(16),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: CustomSearchCategories(
                              onChanged: (value) {
                                if (value.trim().isNotEmpty) {
                                  viewModel.doIntent(
                                    SearchIntent(value.trim()),
                                  );
                                } else {
                                  viewModel.doIntent(GetAllCategoriesIntent());
                                }
                              },
                            ),
                          ),
                          SizedBox(width: resposiveWidth(8)),
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(
                                  resposiveWidth(64),
                                  resposiveHeight(48),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                showFilters(context, (value) {
                                  viewModel.doIntent(FilterIntent(value));
                                });
                              },
                              child: ImageIcon(
                                AssetImage(IconAssets.filterIcon),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  // Show tabs if categories are loaded and available.
                  if (state is CategoriesLoadingState)
                    const Center(child: CircularProgressIndicator())
                  else if (viewModel.categories.isNotEmpty)
                    DefaultTabController(
                      length: viewModel.categories.length,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                  // Show product lists or empty states.
                  if (state is LoadingSearchState ||
                      state is SpecificCategoriesLoadingState ||
                      state is LoadingFilterState)
                    Skeletonizer(
                      enabled: true,
                      containersColor: AppColors.whiteColor,
                      child: _buildProductsList(viewModel.products, 5),
                    )
                  else if (state is SuccessfulSearchState &&
                      viewModel.isSearching)
                    state.products.isNotEmpty
                        ? _buildProductsList(
                          state.products,
                          state.products.length,
                        )
                        : _buildEmptyState("No products found")
                  else if (state is SpecificCategoriesSuccessState &&
                      state.products.isNotEmpty &&
                      !viewModel.isSearching)
                    _buildProductsList(state.products, state.products.length)
                  else if (state is SuccessfulFilterState &&
                      state.products.isNotEmpty &&
                      !viewModel.isSearching)
                    _buildProductsList(state.products, state.products.length)
                  else
                    _buildEmptyState("No products found"),
                ],
              ),
            );
          },
        ),
      ),

      floatingActionButton: SizedBox(
        width: resposiveWidth(100),
        height: resposiveHeight(34),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,

          onPressed: () {
            showFilters(context, (value) {
              viewModel.doIntent(FilterIntent(value));
            });

            print('Floating Action Button Pressed!');
          },

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.filter_list_outlined, color: AppColors.whiteColor),
              SizedBox(width: resposiveWidth(10)),
              Text(
                S.of(context).filter,
                style: AppTextStyles.inter500_14.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ), // لون الزر
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  /// Builds the product list grid.
  Widget _buildProductsList(List products, int length) {
    if (products.isEmpty || length == 0) {
      return _buildEmptyState("No products available");
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
              if (state is AddToCartSuccess && state.id == product.id) {
                EasyLoading.showSuccess(state.message);
              } else if (state is AddToCartError && state.id == product.id) {
                EasyLoading.showError(state.error);
              }
            },
            builder: (context, state) {
              final isLoading =
                  state is AddToCartLoading && state.id == product.id;
              return FlowerCard(
                name: product.title.toString(),
                // beforeDiscount: "${product.discount}",
                beforeDiscount: "${product.price}",
                discountRate: "${product.discount}%",
                // discountRate: "${product.priceAfterDiscount}%",
                cost: '${product.priceAfterDiscount}',
                //  cost: '${product.price}',
                imageUrl: '${product.imgCover}',
                id: "${product.id}",
                isLoading: isLoading,
                onAddToCart: () {
                  context.read<AddToCartCubit>().AddToCart(
                    productId: product.id,
                    quantity: 1,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  /// A helper widget to show empty state messages.
  Widget _buildEmptyState(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.blackColor,
          // fontWeight: FontWeight.bold,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  showFilters(BuildContext context, Function(String) gitFilter) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DrawerWidget(onChanged: gitFilter);
      },
    );
  }
}
