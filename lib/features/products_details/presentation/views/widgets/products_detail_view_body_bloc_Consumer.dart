import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_cubit.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_states.dart';
import 'package:flower_app/features/products_details/presentation/views/widgets/products_view_body.dart';
import 'package:flower_app/features/products_details/presentation/views/widgets/refresh_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductsDetailViewBodyBlocConsumer extends StatefulWidget {
   const ProductsDetailViewBodyBlocConsumer({super.key, required this.id});
  final String id;
  @override
  State<ProductsDetailViewBodyBlocConsumer> createState() =>
      _ProductsDetailViewBodyBlocConsumerState();
}

class _ProductsDetailViewBodyBlocConsumerState
    extends State<ProductsDetailViewBodyBlocConsumer> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<ProductsDetailCubit>().getProductDetails(widget.id),
    );
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsDetailCubit, ProductsDetailStates>(
      builder: (context, state) {
        if (state is ProductsDetailSuccess) {
          return ProductsDetailsViewBody(
            pageController: _pageController,
            state: state,
          );
        } else if (state is ProductsDetailError) {
          return RefreshIndicatorWidget(
            onRefresh: () async {
              await context.read<ProductsDetailCubit>().getProductDetails(
                widget.id,
              );
            },
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is ProductsDetailError) {
          EasyLoading.showError(state.message);
          EasyLoading.dismiss(); // Dismiss loading indicator on error
        } else if (state is ProductsDetailLoading) {
          Future.delayed(Duration.zero, () => EasyLoading.show());
        } else if (state is ProductsDetailSuccess) {
          Future.delayed(
            Duration(seconds: 2),
            () => EasyLoading.dismiss(),
          ); // Dismiss loading when data is successfully loaded
        }
      },
    );
  }
}
