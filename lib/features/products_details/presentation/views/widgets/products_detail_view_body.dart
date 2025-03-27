import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDetailViewBody extends StatefulWidget {
  const ProductsDetailViewBody({super.key});

  @override
  State<ProductsDetailViewBody> createState() => _ProductsDetailViewBodyState();
}

class _ProductsDetailViewBodyState extends State<ProductsDetailViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => context.read<ProductsDetailCubit>().getProductDetails(
        "673e1cd711599201718280fb",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Products Details'));
  }
}
