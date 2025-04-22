import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/widgets/custom_app_bar.dart';
import 'package:flower_app/features/addresses/data/model/user_addresses_dto.dart';
import 'package:flower_app/features/addresses/presentation/cubit/address_details_cubit.dart';
import 'package:flower_app/features/addresses/presentation/views/widgets/address_details_view_body.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/user_addresses_entity.dart';
class AddressDetailsView extends StatelessWidget {
  const AddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    late final AddressDTO initialDto;
    if (args is AddressDTO) {
      initialDto = args;
    } else if (args is Address) {
      initialDto = AddressDTO.fromEntity(args);
    } else {
      initialDto = AddressDTO();
    }
    debugPrint("==== Received arguments:   $args");
    debugPrint("==== Type:     ${args.runtimeType}");

    return BlocProvider(
      create: (_) => getIt.get<AddressDetailsCubit>(),
      child: Scaffold(
        appBar: buildCustomAppBar(
          title: S.of(context).address,
          isVisible: true,
          context: context,
        ),
        body: AddressDetailsViewBody(initialAddress: initialDto),
      ),
    );
  }
}