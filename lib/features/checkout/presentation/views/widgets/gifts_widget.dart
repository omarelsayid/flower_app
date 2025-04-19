import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class GiftsWidget extends StatefulWidget {
  const GiftsWidget({super.key});

  @override
  State<GiftsWidget> createState() => _GiftsWidgetState();
}

class _GiftsWidgetState extends State<GiftsWidget> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
      child: SizedBox(
        width: resposiveWidth(343),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Switch(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                  activeColor: AppColors.whiteColor,
                  activeTrackColor: AppColors.primaryColor,
                  inactiveThumbColor: AppColors.whiteColor,
                  inactiveTrackColor: AppColors.greyColor,
                ),
                Text("It is a gift", style: AppTextStyles.inter500_18),
              ],
            ),
            if (isChecked)
              Column(
                children: [
                  SizedBox(height: resposiveHeight(8)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter the name',
                    ),
                  ),
                  SizedBox(height: resposiveHeight(16)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter the Phone Number',
                    ),
                  ),
                ],
              ),
            SizedBox(height: resposiveHeight(16)),
          ],
        ),
      ),
    );
  }
}
