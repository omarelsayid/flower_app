import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../core/utils/text_styles.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, PagesRoutes.layOutScreen);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            Text("Track order", style: AppTextStyles.inter500_20),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: resposiveHeight(24)),
            Image.asset(
              ImageAssets.paymentSuccess,
              height: resposiveHeight(150),
              width: resposiveWidth(150),
            ),
            SizedBox(height: resposiveHeight(56)),
            Text(
              "Your order placed\nsuccessfully!",
              textAlign: TextAlign.center,
              style: AppTextStyles.inter700_20.copyWith(fontSize: 26),
            ),
            SizedBox(height: resposiveHeight(40)),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Track order",
                style: AppTextStyles.inter700_20.copyWith(
                  fontSize: 14,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
