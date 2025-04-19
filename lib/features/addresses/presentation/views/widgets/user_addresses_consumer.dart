import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/features/addresses/presentation/views/widgets/add_address_button.dart';
import 'package:flower_app/features/addresses/presentation/views/widgets/user_address_card.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/user_addresses_cubit/user_addresses_state.dart';
import '../../cubit/user_addresses_cubit/user_addresses_view_model.dart';

class UserAddressesConsumer extends StatelessWidget {
  const UserAddressesConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAddressesViewModel, UserAddressesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingUserAddressesState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorUserAddressesState) {
          return Center(child: Text(state.message.toString()));
        } else if (state is SuccessUserAddressesState) {
          final addresses = state.data;
          final deletingId = state.deletingId;

          final itemCount = addresses.isEmpty ? 2 : addresses.length + 1;

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemCount: itemCount,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (addresses.isEmpty) {
                if (index == 0) {
                  return Center(child: Text(S.of(context).no_address_found));
                } else {
                  return AddAddressButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PagesRoutes.signInScreen);
                    },
                  );
                }
              }

              if (index < addresses.length) {
                final address = addresses[index];
                final isDeleting = deletingId == address.id;

                return AddressCard(
                  address: address,
                  isDeleting: isDeleting,
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        PagesRoutes.userAddressesDetailsScreen,
                        arguments: address,
                      ),
                  onDelete:
                      () => context.read<UserAddressesViewModel>().doIntent(
                        DeleteUserAddressClickedIntent(address.id!),
                      ),
                  onEdit: () {},
                );
              }

              return AddAddressButton(
                onPressed: () {
                  Navigator.pushNamed(context, PagesRoutes.signInScreen);
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
