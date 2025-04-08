import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flower_app/features/products_details/domain/repositories/get_product_details_repo.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_cubit.dart';
import 'package:flower_app/features/products_details/presentation/views/widgets/products_detail_view_body_bloc_Consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key,  this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProductsDetailCubit(getIt.get<GetProductDetailsRepo>()),
      child: Scaffold(body: ProductsDetailViewBodyBlocConsumer(id: id ?? '')),
    );
  }
}
