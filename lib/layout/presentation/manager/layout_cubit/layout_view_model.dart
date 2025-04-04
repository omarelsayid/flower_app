import 'package:flower_app/layout/presentation/manager/layout_cubit/layout_state.dart';
import 'package:flower_app/layout/presentation/tabs/category_tab.dart';
import 'package:flower_app/layout/presentation/tabs/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/occasions/presentation/views/occasion_screen.dart';
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
  OccasionsScreen(),
  const CategoryTab(),
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
