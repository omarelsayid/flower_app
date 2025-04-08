import 'package:flower_app/home_tab/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:flower_app/home_tab/presentation/cubit/occasion_cubit/occasion_cubit.dart';
import 'package:flower_app/layout/presentation/manager/layout_cubit/layout_state.dart';
import 'package:flower_app/layout/presentation/tabs/category_tab.dart';
import 'package:flower_app/home_tab/presentation/views/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/injectable_initializer.dart';
import '../../../../home_tab/presentation/cubit/best_seller_cubit/best_seller_cubit.dart';
import '../../../../home/occasions/presentation/views/occasion_screen.dart';
import '../../../../categories/presentation/categories_tab.dart';
import '../../tabs/cart_tab.dart';
import '../../tabs/profile_tab.dart';


class LayoutViewModel extends Cubit <LayoutState> {
  LayoutViewModel() : super(LayoutInitialState());
  int currentIndex = 0;
  void doIntent(LayoutIntent layoutIntent) {
    switch(layoutIntent) {
      case LayoutChangeBottomNavIntent():
        _changeBottomNav(layoutIntent.index);
    }
  }
List<Widget>tabs=[
   MultiBlocProvider(
  providers: [
    BlocProvider(
  create: (context) => getIt.get<CategoryCubit>()..fetchCategories(),
),
    BlocProvider(
      create: (context) => getIt.get<BestSellerCubit>()..getBestSeller(),
    ),
    BlocProvider(
      create: (context) => getIt.get<OccasionCubit>()..fetchOccasion(),
    ),
  ],
  child: HomeTab(),
),
  const CategoryTab(),
  // OccasionsScreen(),
  const HomeTab(),
  const CategoriesTab(),
  const CartTab(),
  const ProfileTab(),
];
  void _changeBottomNav(int index) {
    emit( LayoutInitialState());
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}
sealed class LayoutIntent{}
class LayoutChangeBottomNavIntent extends LayoutIntent{
  int index;
  LayoutChangeBottomNavIntent( this.index);
}
