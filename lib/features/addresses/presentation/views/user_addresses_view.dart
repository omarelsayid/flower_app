import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_icons.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/addresses/presentation/views/widgets/user_addresses_consumer.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/features/addresses/presentation/cubit/user_addresses_cubit/user_addresses_view_model.dart';

import '../../../../core/di/injectable_initializer.dart';

class UserAddressesView extends StatelessWidget {
  const UserAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt.get<UserAddressesViewModel>()..doIntent(GetUserAddressesClickedIntent()),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                },
                    icon: Icon(AppIcons.back)
                ),
                Text(S.of(context).savedAddress,style: AppTextStyles.inter500_20.copyWith(color: AppColors.blackColor,decoration: TextDecoration.none),)
              ],
            ),
            Expanded(child:  UserAddressesConsumer())
          ],
        ),
      ),
    );
  }
}
