import 'dart:developer';
import 'package:flower_app/categories/presentation/manager/categories_state.dart';
import 'package:flower_app/categories/presentation/manager/categories_view_model.dart';
import 'package:flower_app/categories/presentation/widget/custom_search_categories.dart';
import 'package:flower_app/core/widgets/custom_diaolg.dart';
import 'package:flower_app/core/widgets/flower_card.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_colors.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}
CategoriesViewModel viewModel = getIt.get<CategoriesViewModel>();

class _CategoriesTabState extends State<CategoriesTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;

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
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * .05),
                  CustomSearchCategories(
                    onChanged: (value) {
                      if (value
                          .trim()
                          .isNotEmpty) {
                        viewModel.isSearching = true;
                        viewModel.doIntent(SearchIntent(value));
                      } else {
                        viewModel.isSearching = false;
                        viewModel.doIntent(GetAllCategoriesIntent());
                      }
                    },
                  ),
                  SizedBox(height: height * .015),
                  DefaultTabController(
                    length: viewModel.categories.length,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state is CategoriesLoadingState ||
                            state is SpecificCategoriesLoadingState
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
                                .map((source) => Tab(text: source.name))
                                .toList(),
                          ),
                        )
                            : const SizedBox.shrink(),
                        state is SpecificCategoriesLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : state is SpecificCategoriesSuccessState &&
                            state.products.isNotEmpty &&
                            viewModel.isSearching == false
                            ? SizedBox(
                            height: height * .75,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2/2.8,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16
                              ),
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                              return FlowerCard(
                                imageUrl: state.products[index].imgCover!,
                                beforeDiscount: state.products[index].price
                                    .toString(),
                                cost: state.products[index].price.toString(),
                                discountRate: state.products[index].discount
                                    .toString(),
                                name: state.products[index].title.toString(),);
                            },))
                            : state is SuccessfulSearchState &&
                            viewModel.products.isNotEmpty &&
                            viewModel.isSearching == true ?
                        SizedBox(
                            height: height * .75,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  state.products[index].title.toString(),
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                );
                              },
                            ),)
                                :
                            const Text("No products found"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  )
                ],
              ),
            )
            ,
          );
        },
      ),
    );
  }
}
