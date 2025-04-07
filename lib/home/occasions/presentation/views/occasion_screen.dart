import 'dart:developer';

import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../core/services/screen_size_service.dart';
import '../../../../core/widgets/occasion_widget.dart';
import '../../domain/entity/occasions_entity.dart';
import '../cubit/occasion_view_model.dart';
import '../cubit/occasion_state.dart';

class OccasionsScreen extends StatefulWidget {
  const OccasionsScreen({super.key});

  @override
  _OccasionsScreenState createState() => _OccasionsScreenState();
}

class _OccasionsScreenState extends State<OccasionsScreen> with SingleTickerProviderStateMixin {
  late OccasionViewModel viewModel;
  TabController? _tabController;
  List<Occasion?> occasions = [];

  @override
  void initState() {
    super.initState();
    viewModel = getIt<OccasionViewModel>();
    viewModel.doIntent(OccasionClickedIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: BlocBuilder<OccasionViewModel, OccasionState>(
        builder: (context, state) {
          if (state is SuccessOccasionState) {
            occasions = state.occasion;

            if (_tabController == null || _tabController!.length != occasions.length) {
              // `vsync` is provided by the `TickerProvider`,
              // which ensures that the tab animations are synchronized with the screen's refresh rate.
              _tabController = TabController(length: occasions.length, vsync: this);

              // Listen to tab change and update selected occasion
              _tabController?.addListener(() {
                if (_tabController!.indexIsChanging) {
                  viewModel.doIntent(ChangeOccasionIndexIntent(_tabController!.index));
                }
              });

              //microtask used here to ensure that the first tab is selected instead of rebuild bloc provider
              Future.microtask(() {
                if (occasions.isNotEmpty) {
                  viewModel.doIntent(SpecificOccasionClickedIntent(occasions.first!.id.toString()));
                }
              });
            }
          }

          if (occasions.isEmpty) {
            return const Scaffold(
              body: Center(child: Text("No occasions available")),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Occasions", style: AppTextStyles.inter500_20),
                  Text(
                    "Bloom with our exquisite best sellers",
                    style: AppTextStyles.inter400_14.copyWith(
                      color: AppColors.greyDarkColor,
                    ),
                  ),
                ],
              ),
              bottom: _tabController == null
                  ? const TabBar(tabs: [])
                  : TabBar(
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.greyColor,
                indicatorColor: AppColors.primaryColor,
                isScrollable: true,
                tabs: occasions.map((occasion) => Tab(text: occasion?.name ?? '')).toList(),
              ),
            ),
            body: BlocBuilder<OccasionViewModel, OccasionState>(
              builder: (context, state) {
                if (state is LoadingOccasionState) {
                  EasyLoading.show();
                } else if (state is SuccessSpecificOccasionState) {
                  final products = state.specificOccasion;
                  return GridView.builder(
                    padding: const EdgeInsets.all(2),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: ScreenSizeService.width * (8 / ScreenSizeService.baseWidth), // Add spacing between columns
                      mainAxisSpacing: ScreenSizeService.height * (8 / ScreenSizeService.baseHeight),  // Add spacing between rows
                      childAspectRatio: 0.7,),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return OccasionWidget(flowers: [
                        {
                          "name": product.title.toString(),
                          "discount": "${product.discount}",
                          "discountRate": "${product.priceAfterDiscount}%",
                          "cost": '${product.price}',
                          "imageUrl": '${product.imgCover}'
                        },
                      ]);
                    },
                  );

                  // return ListView.builder(
                  //   itemCount: products.length,
                  //   itemBuilder: (context, index) {
                  //     final product = products[index];
                  //     print('Product: ${product.title}, Discount: ${product.discount}');
                  //     return OccasionWidget(flowers: [
                  //       {
                  //         "name":product.title.toString(),
                  //         "discount": "${product.discount}",
                  //         "discountRate": "${product.priceAfterDiscount}",
                  //         "cost": '${product.price}',
                  //         "imageUrl": '${product.imgCover}'
                  //       },
                  //     ],);
                  //     // return ListTile(
                  //     //   leading: product.imgCover != null
                  //     //       ? Image.network(product.imgCover!)
                  //     //       : const Icon(Icons.image),
                  //     //   title: Text(product.title ?? "No Title"),
                  //     //   subtitle: Text(product.slug ?? ""),
                  //     // );
                  //   },
                  // );
                } else if (state is ErrorOccasionState) {
                  return Center(child: Text("Error: ${state.message}"));
                }
                return const Center(child: Text("Select an occasion"));
              },
            ),
          );
        },
      ),
    );
  }
}
