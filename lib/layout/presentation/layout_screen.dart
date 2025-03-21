import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/layout/presentation/manager/layout_cubit/layout_state.dart';
import 'package:flower_app/layout/presentation/manager/layout_cubit/layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutViewModel viewModel = LayoutViewModel();
    return BlocBuilder<LayoutViewModel, LayoutState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          body: viewModel.tabs[viewModel.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: (value) {
              viewModel.doIntent(LayoutChangeBottomNavIntent(value));
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconAssets.homeIcon)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconAssets.categoryIcon)),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconAssets.cartIcon)),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconAssets.profileIcon)),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
