import 'package:flutter/material.dart';

import '../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class FilterWidget extends StatelessWidget {
  final String sort;
  final bool value;
  final ValueChanged<bool?> onChanged;
  const FilterWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.sort,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: resposiveHeight(52),
      width: resposiveWidth(343),
      child: Card(
        elevation: 0.5,
        color: AppColors.whiteColor,
        child: Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sort,
                style: AppTextStyles.inter500_16.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              GestureDetector(
                onTap: () => onChanged.call(!value),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryColor, // outline
                      width: 2,
                    ),
                    color: AppColors.whiteColor,
                  ),
                  child:
                      value
                          ? Center(
                            child: Icon(
                              Icons.check_circle,
                              size: 20,
                              color: AppColors.primaryColor,
                            ),
                          )
                          : null,
                ),
              ),

              // Checkbox(
              //   checkColor: Colors.white,
              //   activeColor: AppColors.primaryColor,
              //   value: value,
              //   onChanged: onChanged,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
