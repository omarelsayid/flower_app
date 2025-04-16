import 'package:flower_app/core/widgets/custom_app_bar.dart';
import 'package:flower_app/features/address_details/presentation/view/address_details_view_body.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddressDetailsView extends StatelessWidget {
  const AddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: S.of(context).address, isVisible: true, context: context),
    body: AddressDetailsViewBody(),
    );
  }
}
