import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/layout/presentation/manager/layout_cubit/layout_state.dart';
import 'package:flower_app/layout/presentation/manager/layout_cubit/layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class LayoutScreen extends StatelessWidget {
//   const LayoutScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     LayoutViewModel viewModel = LayoutViewModel();
//     return BlocProvider(
//       create: (context) => viewModel,
//       child: BlocBuilder<LayoutViewModel, LayoutState>(
//         builder: (context, state) {
//           return Scaffold(
//             resizeToAvoidBottomInset: true,
//             body: viewModel.tabs[viewModel.currentIndex],
//             bottomNavigationBar: BottomNavigationBar(
//               currentIndex: viewModel.currentIndex,
//               onTap: (value) {
//                 viewModel.doIntent(LayoutChangeBottomNavIntent(value));
//               },
//               items: [
//                 BottomNavigationBarItem(
//                   icon: ImageIcon(AssetImage(IconAssets.homeIcon)),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: ImageIcon(AssetImage(IconAssets.categoryIcon)),
//                   label: 'Categories',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: ImageIcon(AssetImage(IconAssets.cartIcon)),
//                   label: 'Cart',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: ImageIcon(AssetImage(IconAssets.profileIcon)),
//                   label: 'Profile',
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutViewModel(initialIndex),
      child: BlocBuilder<LayoutViewModel, LayoutState>(
        builder: (context, state) {
          final viewModel = context.read<LayoutViewModel>();
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: viewModel.tabs[viewModel.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              onTap: (value) {
                viewModel.doIntent(LayoutChangeBottomNavIntent(value));
              },
              items: const [
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
      ),
    );
  }
}
