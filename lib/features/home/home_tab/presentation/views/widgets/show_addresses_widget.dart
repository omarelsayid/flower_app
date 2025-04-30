import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/constans.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/addresses/presentation/cubit/user_addresses_cubit/user_addresses_state.dart';
import 'package:flower_app/features/addresses/presentation/cubit/user_addresses_cubit/user_addresses_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../addresses/domain/entity/user_addresses_entity.dart';

class ShowAddressesWidget extends StatefulWidget {
  const ShowAddressesWidget({super.key});

  @override
  _ShowAddressesWidgetState createState() => _ShowAddressesWidgetState();
}

class _ShowAddressesWidgetState extends State<ShowAddressesWidget> {
  Address? _selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kVerticalHPadding),
      child: BlocBuilder<UserAddressesViewModel, UserAddressesState>(
        builder: (context, state) {
          List<Address> addresses = [];
          Widget displayText;

          if (state is LoadingUserAddressesState) {
            displayText = const Text('Loading addresses...');
          } else if (state is SuccessUserAddressesState) {
            addresses = state.data;
            _selectedAddress ??= addresses.isNotEmpty ? addresses.first : null;

            if (_selectedAddress == null) {
              displayText = const Text('No addresses saved');
            } else {
              displayText = Text(
                'Deliver to ${_selectedAddress!.street}',
                style: AppTextStyles.inter400_14,
              );
            }
          } else if (state is ErrorUserAddressesState) {
            displayText = Text('Error: ${state.message}');
          } else {
            displayText = const Text('Unexpected state');
          }

          return Row(
            children: [
              Image.asset(IconAssets.LocationIcon),
              const SizedBox(width: 8),
              Expanded(child: displayText),
              PopupMenuButton<Address>(
                icon: const Icon(Icons.keyboard_arrow_down_sharp),
                onSelected: (address) {
                  setState(() {
                    _selectedAddress = address;
                  });
                },
                itemBuilder: (_) {
                  return addresses.map((address) {
                    return PopupMenuItem(
                      value: address,
                      child: Text(address.street!),
                    );
                  }).toList();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
