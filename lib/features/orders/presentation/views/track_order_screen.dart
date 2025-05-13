import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/orders/presentation/views/widgets/custom_card_driver.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/generated/l10n.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as String;
    var local = S.of(context);
    final Stream<DocumentSnapshot> orderStream =
        FirebaseFirestore.instance.collection('order').doc(arg).snapshots();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: resposiveHeight(90),
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),

            Text(local.TrackOrder, style: AppTextStyles.inter700_20),
          ],
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: orderStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text("Order not found"));
          }

          final orderData = snapshot.data!;
          final int statusIndex = orderData.get("status") ?? 0;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
                  child: Text(
                    "wreyaz s u as",
                    style: AppTextStyles.inter500_14,
                  ),
                ),
                SizedBox(height: resposiveHeight(8)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
                  child: Text(
                    "03 Sep 2024, 11:00 AM",
                    style: AppTextStyles.inter500_16.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: resposiveHeight(16)),
                const Divider(color: AppColors.greyColor, height: .9),
                SizedBox(height: resposiveHeight(40)),
                CustomCardDriver(index: statusIndex),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Show Map",
                    style: AppTextStyles.inter600_18.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(height: resposiveHeight(24)),
              ],
            ),
          );
        },
      ),
    );
  }
}
