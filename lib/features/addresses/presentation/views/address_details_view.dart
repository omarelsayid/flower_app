import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/widgets/custom_app_bar.dart';
import 'package:flower_app/features/addresses/presentation/cubit/address_details_cubit.dart';
import 'package:flower_app/features/addresses/presentation/cubit/get_addresses_suggestio_cubit/get_addresses_suggestio_cubit.dart';
import 'package:flower_app/features/addresses/presentation/cubit/place_details_cubit/place_details_cubit.dart';
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
    late final Address initialAddress;
    if (args is Address) {
      initialAddress = args;
    } else {
      initialAddress = Address(); // create an empty Address if no argument passed
    }
    debugPrint("==== Received arguments:   $args");
    debugPrint("==== Type:     ${args.runtimeType}");

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<AddressDetailsCubit>()),
        BlocProvider(create: (context) => getIt.get<GetAddressesSuggestioCubit>()),
        BlocProvider(create: (context) => getIt.get<PlaceDetailsCubit>()),
      ],
      child: Scaffold(
        appBar: buildCustomAppBar(
          title: S.of(context).address,
          isVisible: true,
          context: context,
        ),
        body: AddressDetailsViewBody(initialAddress: initialAddress),
      ),
    );
  }
}

