import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/user_addresses_entity.dart';

class UserAddressesCardDetailsWidget extends StatelessWidget {
  const UserAddressesCardDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final address = ModalRoute.of(context)!.settings.arguments as Address;
    var tr = S.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(tr.address_details)),
      body: Container(
        width: double.infinity,
        height: resposiveHeight(300),
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${tr.name}: ${address.username}'),
            Text('${tr.phoneNumber}: ${address.phone}'),
            Divider(),
            Text('${tr.city}: ${address.city}'),
            Text('${tr.street}: ${address.street}'),

            Text('lat: ${address.lat}'),
            Text('long: ${address.long}'),
          ],
        ),
      ),
    );
  }}
