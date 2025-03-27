import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_cubit.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_states.dart';
import 'package:flower_app/features/products_details/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductsDetailViewBodyBlocConsumer extends StatefulWidget {
  const ProductsDetailViewBodyBlocConsumer({super.key, this.id});
  final int? id;
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
      () => context.read<ProductsDetailCubit>().getProductDetails(
        "673e1cd711599201718280fb",
      ),
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
        }
        return Container();
      },
      listener: (context, state) {
        if (state is ProductsDetailError) {
          EasyLoading.showError(state.message);
          Future.delayed(
            Duration(seconds: 2),
            () => EasyLoading.dismiss(),
          ); // Dismiss loading indicator on error
        } else if (state is ProductsDetailLoading) {
          EasyLoading.show();
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
