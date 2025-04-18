import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/widgets/custom_app_bar.dart';
import 'package:flower_app/features/address_details/domain/repository/address_details_repo.dart';
import 'package:flower_app/features/address_details/presentation/cubit/address_details_cubit.dart';
import 'package:flower_app/features/address_details/presentation/view/widgets/address_details_view_body.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressDetailsView extends StatelessWidget {
  const AddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<AddressDetailsCubit>(),
      child: Scaffold(
        appBar: buildCustomAppBar(
          title: S.of(context).address,
          isVisible: true,
          context: context,
        ),
        body: const AddressDetailsViewBody(),
      ),
    );
  }
}
