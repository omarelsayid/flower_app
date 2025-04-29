import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/addresses/presentation/views/widgets/add_address_button.dart';
import 'package:flower_app/features/addresses/presentation/views/widgets/user_address_card.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user_addresses_dto.dart';
import '../../../domain/entity/user_addresses_entity.dart';
import '../../cubit/user_addresses_cubit/user_addresses_state.dart';
import '../../cubit/user_addresses_cubit/user_addresses_view_model.dart';

class UserAddressesBuilder extends StatelessWidget {
  const UserAddressesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAddressesViewModel, UserAddressesState>(
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
            padding: EdgeInsets.symmetric(
              horizontal: resposiveWidth(16),
              vertical: resposiveHeight(16),
            ),
            itemCount: itemCount,
            separatorBuilder: (_, __) => SizedBox(height: resposiveHeight(16)),
            itemBuilder: (context, index) {
              if (addresses.isEmpty) {
                if (index == 0) {
                  return Center(
                    child: Text(
                      S.of(context).no_address_found,
                      style: AppTextStyles.inter500_18.copyWith(
                        color: AppColors.blackColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  );
                } else {
                  return AddAddressButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PagesRoutes.addressScreen);
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
                  onEdit: () async {
                    final Address entity = address;
                    // final AddressDTO dto = AddressDTO.fromEntity(entity);
                    final result = await Navigator.pushNamed(
                      context,
                      PagesRoutes.addressScreen,
                      arguments: entity,
                    );

                    if (result == true) {
                      context.read<UserAddressesViewModel>().doIntent(
                        GetUserAddressesClickedIntent(),
                      );
                    }
                  },
                );
              }

              return AddAddressButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    PagesRoutes.addressScreen,
                  );

                  if (result == true) {
                    context.read<UserAddressesViewModel>().doIntent(
                      GetUserAddressesClickedIntent(),
                    );
                  }
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
