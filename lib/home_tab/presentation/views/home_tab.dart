import 'dart:developer';

import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/home_tab/presentation/cubit/best_seller_cubit/best_seller_cubit.dart';
import 'package:flower_app/home_tab/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:flower_app/home_tab/presentation/cubit/occasion_cubit/occasion_cubit.dart';
import 'package:flower_app/home_tab/presentation/views/widgets/custom_card_widget.dart';
import 'package:flower_app/home_tab/presentation/views/widgets/category_widget.dart';
import 'package:flower_app/home_tab/presentation/views/widgets/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/services/shared_preference_services.dart';
import '../../../core/utils/constans.dart';
import '../../../di/injectable_initializer.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: kVerticalHPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // build search bar
            Row(
              children: [
                SvgPicture.asset(SvgImages.logo),
                SizedBox(width: 17),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: AppTextStyles.inter400_14.copyWith(
                        color: AppColors.greyColor,
                      ),
                      prefix: Icon(Icons.search, color: AppColors.greyColor),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
        
                // Search bar
              ],
            ), // logo
            // address
            Padding(
              padding: EdgeInsets.symmetric(vertical: kVerticalHPadding),
              child: Row(
                children: [
                  Image.asset(IconAssets.LocationIcon),
                  Text(
                    " Deliver to 2XVP+XC - Sheikh Zayed",
                    style: AppTextStyles.inter400_14,
                  ),
                  IconButton(
                    onPressed: () async {
                      print(
                        await SharedPreferenceServices.getData(
                          AppConstants.token,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 35,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
        
            // category
            Column(
              children: [
               RowWidget(txt: "Categories", leading_text:"View all", onPressed: (){
                 Navigator.pushNamed(context, PagesRoutes.categoriesScreen,);
               }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (context, state) {
                        if(state is CategoryLoading){
                          return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
        
                        }
                        else if(state is CategoriesLoaded)
                        {
                          log("${state.categories.length}");
                          log(state.categories[1].name);
        
                          return Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: state.categories.map((cat) {
                                  return CategoryWidget(imgUrl: cat.image, name: cat.name);
                                },).toList(),
                              ),
                            ),
                          );
        
                        }
                        else if (state is CategoriesError && !state.message.contains("internet"))
                        {
                          return  Center(child: Text(state.message));
                        }
                        else if(state is CategoriesError && state.message.contains("internet")){
        
                          EasyLoading.showError(state.message);
                        }
        
                        return const SizedBox.shrink();
        
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:16 ,),
            Column(
              children: [
               RowWidget(txt: "Best seller", leading_text:"View all", onPressed: (){}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<BestSellerCubit, BestSellerState>(
                      builder: (context, state) {
                        if(state is BestSellerLoading){
                          return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
        
                        }
                        else if(state is BestSellerSuccess)
                        {
                          log("${state.products.length}");
                          log(state.products[1].title!);
        
                          return Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: state.products.map((cat) {
                                  return CustomCardWidget(name: cat.title!,price: cat.price!,imgUrl:cat.imgCover! ,);
                                },).toList(),
                              ),
                            ),
                          );
        
                        }
                        else if (state is BestSellerError && !state.error.contains("internet"))
                        {
                          return  Center(child: Text(state.error));
                        }
                        else if(state is BestSellerError && state.error.contains("internet")){
        
                          EasyLoading.showError(state.error);
                        }
        
                        return const SizedBox.shrink();
        
                      },
                    ),
                  ],
                ),
              ],
            ),
        
            SizedBox(height:16 ,),
            Column(
              children: [
                RowWidget(txt: "Occasion", leading_text:"View all", onPressed: (){}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<OccasionCubit, OccasionState>(
                      builder: (context, state) {
                        if(state is OccasionLoading){
                          return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
        
                        }
                        else if(state is OccasionSuccess)
                        {
                          log("${state.occasions.length}");
                          log(state.occasions[1].name);
        
                          return Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: state.occasions.map((cat) {
                                  return CustomCardWidget(name: cat.name,imgUrl:cat.image,price: null, );
                                },).toList(),
                              ),
                            ),
                          );
        
                        }
                        else if (state is OccasionError && !state.message.contains("internet"))
                        {
                          return  Center(child: Text(state.message));
                        }
                        else if(state is OccasionError && state.message.contains("internet")){
        
                          EasyLoading.showError(state.message);
                        }
        
                        return const SizedBox.shrink();
        
                      },
                    ),
                  ],
                ),
              ],
            ),
        
        
          ],
        ),
      ),
    );
  }
}
