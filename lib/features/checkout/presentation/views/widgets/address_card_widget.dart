import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/checkout/domain/entites/addresses_response_entity.dart';
import 'package:flutter/material.dart';

class AddressCardWidget extends StatelessWidget {
  const AddressCardWidget({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.value, required this.addressEntity,
  });

  final int selectedValue;
  final void Function(int?)? onChanged;
  final int value;
  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: resposiveWidth(343),
      height: resposiveHeight(83),
      padding: EdgeInsets.symmetric(horizontal: resposiveWidth(8)),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x40535353),
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Radio(
                    value: value,
                    groupValue: selectedValue,
                    onChanged: onChanged,
                  ),
                  Text(addressEntity.city ?? '', style: AppTextStyles.inter500_16),
                ],
              ),
              SizedBox(height: resposiveHeight(2)),
              Text(addressEntity.street ?? '', style: AppTextStyles.roboto400_14),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit_outlined, size: 30),
          ),
        ],
      ),
    );
  }
}
