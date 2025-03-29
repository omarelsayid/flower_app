import 'package:flower_app/categories/presentation/manager/categories_state.dart';
import 'package:flower_app/categories/presentation/manager/categories_view_model.dart';
import 'package:flower_app/categories/presentation/widget/custom_search_categories.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/core/widgets/custom_diaolg.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_assets.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    CategoriesViewModel viewModel = getIt.get<CategoriesViewModel>();
    return BlocProvider(
      create:
          (context) =>
      getIt.get<CategoriesViewModel>(),
      child: BlocConsumer<CategoriesViewModel, CategoriesState>(
        bloc: viewModel ..doIntent(GetAllCategoriesIntent()),
        listener: (context, state) {
          if (state is CategoriesErrorState) {
            DialogUtils.showMessage(
              context: context,
              message: state.errMessage,
              title: "Error",
              negativeActionName: "Cancel",
            );
          }
        },
        builder: (context, state) {
          return state is CategoriesLoadingState
              ? Center(child: CircularProgressIndicator())
              : state is CategoriesSuccessState
          ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height * .05),
                CustomSearchCategories(),
                SizedBox(height: 16),
                DefaultTabController(
                    length: viewModel.categories.length,
                    child: Column(
                      children: [
                      TabBar(
                      isScrollable: true,
                      labelColor: AppColors.primaryColor,
                      unselectedLabelColor: AppColors.greyColor,
                      indicatorColor: AppColors.primaryColor,
                      indicatorWeight: 4,
                      tabAlignment: TabAlignment.start,
                      tabs:
                      viewModel.categories
                          .map(
                            (category) =>
                            Tab(text: category.name),
                      )
                          .toList(),
                    ),

              ],
            ),
          ),
          ],
          ),
          )
              : Center(
          child: Text(
          "No Categories",
          style: AppTextStyles.inter400_14.copyWith(
          color: AppColors.primaryColor,
          )
          ,
          )
          ,
          );
        },
      ),
    );
  }
}
