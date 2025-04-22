import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/checkout/presentation/cubits/checkout_cubit/checkout_view_model.dart';
import 'package:flower_app/features/checkout/presentation/cubits/get_addresses_cubit/get_addresses_view_model.dart';
import 'package:flower_app/features/checkout/presentation/views/checkout_view_body.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatelessWidget {
  CheckoutView({super.key});
  GetAddressesViewModel getAddressesViewModel =
      getIt.get<GetAddressesViewModel>();
  @override
  Widget build(BuildContext context) {
    final List<double> total =
        ModalRoute.of(context)!.settings.arguments as List<double>;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getAddressesViewModel,),
        BlocProvider(create: (context) => getIt.get<CheckoutViewModel>(),)
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).checkout,
            style: AppTextStyles.inter500_20.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ),
        body: CheckoutViewBody(
          getAddressesViewModel: getAddressesViewModel,
          total: total,
        ),
      ),
    );
  }
}
