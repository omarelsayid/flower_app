import 'package:flower_app/features/addresses/presentation/cubit/user_addresses_cubit/user_addresses_view_model.dart';
import 'package:flower_app/features/cart/presentation/cubit/get_user_cart_cubit/get_user_cart_cubit.dart';
import 'package:flower_app/features/home/home_tab/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:flower_app/features/home/home_tab/presentation/cubit/occasion_cubit/occasion_cubit.dart';
import 'package:flower_app/layout/presentation/manager/layout_cubit/layout_state.dart';
import 'package:flower_app/features/home/home_tab/presentation/views/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injectable_initializer.dart';
import '../../../../features/cart/presentation/cubit/delete_cubit/delete_specific_item_cubit/delete_specific_item_cubit.dart';
import '../../../../features/cart/presentation/cubit/update_quantity_cubit/update_quantity_cubit.dart';
import '../../../../features/cart/presentation/views/cart_tab.dart';
import '../../../../features/home/home_tab/presentation/cubit/best_seller_cubit/best_seller_cubit.dart';
import '../../../../features/home/categories/presentation/categories_tab.dart';
import '../../../../features/profile/main_profile_screen/presentation/views/profile_tab.dart';

class LayoutViewModel extends Cubit<LayoutState> {
  LayoutViewModel(this.currentIndex) : super(LayoutInitialState());
  int currentIndex = 0;
  void doIntent(LayoutIntent layoutIntent) {
    switch (layoutIntent) {
      case LayoutChangeBottomNavIntent():
        _changeBottomNav(layoutIntent.index);
    }
  }

  List<Widget> tabs = [
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
        BlocProvider(
          create: (context) => getIt.get<UserAddressesViewModel>()..doIntent(GetUserAddressesClickedIntent()),
        ),

      ],
      child: HomeTab(),
    ),
    // OccasionsScreen(),
    // const HomeTab(),
    CategoriesTab(),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<DeleteSpecificItemCubit>()),
        BlocProvider(create: (context) => getIt.get<GetUserCartCubit>()),
        BlocProvider(create: (context) => getIt.get<UpdateQuantityCubit>()),
      ],
      child: CartTab(),
    ),
    const ProfileTab(),
  ];
  void _changeBottomNav(int index) {
    emit(LayoutInitialState());
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}

sealed class LayoutIntent {}

class LayoutChangeBottomNavIntent extends LayoutIntent {
  int index;
  LayoutChangeBottomNavIntent(this.index);
}
