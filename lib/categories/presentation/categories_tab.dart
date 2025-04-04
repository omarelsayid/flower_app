import 'dart:developer';

import 'package:flower_app/categories/presentation/manager/categories_state.dart';
import 'package:flower_app/categories/presentation/manager/categories_view_model.dart';
import 'package:flower_app/categories/presentation/widget/custom_search_categories.dart';
import 'package:flower_app/core/widgets/custom_diaolg.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/text_styles.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    CategoriesViewModel viewModel = getIt.get<CategoriesViewModel>();
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<CategoriesViewModel, CategoriesState>(
        bloc: viewModel..doIntent(GetAllCategoriesIntent()),
        listener: (context, state) {
          if (state is CategoriesErrorState) {
            DialogUtils.showMessage(
              context: context,
              message: state.errMessage,
              title: "Error",
              negativeActionName: "Cancel",
            );
          }

          // if (viewModel.categories.isNotEmpty) {
          //   viewModel.doIntent(
          //     GetSpecificCategoryIntent(
          //       viewModel.categories[viewModel.currentIndex].id.toString(),
          //     ),
          //   );
          //}
          if (state is SpecificCategoriesErrorState) {
            DialogUtils.showMessage(
              context: context,
              message: state.errMessage,
              title: "Error",
              negativeActionName: "Cancel",
            );
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height * .05),
                CustomSearchCategories(),
                SizedBox(height: height * .015),
                viewModel.categories.isNotEmpty
                    ? DefaultTabController(
                      length: viewModel.categories.length,
                      child: Column(
                        children: [
                          state is CategoriesLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : state is CategoriesSuccessState &&
                                      viewModel.categories.isNotEmpty ||
                                  state is SpecificCategoriesSuccessState
                              ? Align(
                                alignment: Alignment.centerLeft,
                                child: TabBar(
                                  onTap: (value) {
                                    viewModel.currentIndex = value;
                                    viewModel.doIntent(
                                      ChangeCategoriesIndexIntent(value),
                                    );
                                  },
                                  isScrollable: true,
                                  labelColor: AppColors.primaryColor,
                                  unselectedLabelColor: AppColors.greyColor,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorColor: AppColors.primaryColor,
                                  indicatorWeight: 4,
                                  tabAlignment: TabAlignment.start,
                                  padding: EdgeInsets.zero,

                                  tabs:
                                      viewModel.categories
                                          .map(
                                            (source) => Tab(text: source.name),
                                          )
                                          .toList(),
                                ),
                              )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    )
                    : Center(
                      child: Text(
                        "No categories found",
                        style: AppTextStyles.roboto400_18,
                      ),
                    ),
                state is SpecificCategoriesSuccessState &&
                        state.products.isNotEmpty
                    ? Expanded(
                      child: ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return Text(
                            state.products[index].title.toString(),
                            style: TextStyle(color: AppColors.primaryColor),
                          );
                        },
                      ),
                    )
                    : state is SpecificCategoriesLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                      child: Text(
                        "No products found",
                        style: AppTextStyles.roboto400_18,
                      ),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
