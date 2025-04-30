import 'package:flower_app/features/home/categories/presentation/widget/filter_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/get_resposive_height_and_width.dart';
import '../../../../../core/services/screen_size_service.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/constans.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';

class DrawerWidget extends StatefulWidget {
  //void Function(String)? onChanged;
  DrawerWidget({super.key, required this.onChanged});
  void Function(String) onChanged;
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool lowBrice = false;
  bool highBrice = false;
  bool newDate = false;
  bool old = false;
  bool discount = false;
  String filter = '0';
  RangeValues currentRangeValues = RangeValues(200, 500);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: resposiveWidth(370),
      height: resposiveHeight(600),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        color: AppColors.whiteColor,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: kHorizontalPadding,
              left: kHorizontalPadding,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: resposiveHeight(16),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: resposiveWidth(80),
                      height: resposiveHeight(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: AppColors.greyDarkColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  S.of(context).sort_py,
                  style: AppTextStyles.inter700_20.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                FilterWidget(
                  value: lowBrice,
                  onChanged: (value) {
                    setState(() {
                      lowBrice = value!;
                      if (lowBrice == true) {
                        filter = "price";
                        newDate = false;
                        old = false;
                        discount = false;
                        highBrice = false;
                      }
                    });
                  },
                  sort: S.of(context).lowes_Price,
                ),
                FilterWidget(
                  value: highBrice,
                  onChanged: (value) {
                    setState(() {
                      highBrice = value!;
                      if (highBrice == true) {
                        filter = "-price";
                        lowBrice = false;
                      }
                    });
                  },
                  sort: S.of(context).highest_Price,
                ),
                FilterWidget(
                  value: newDate,
                  onChanged: (value) {
                    setState(() {
                      newDate = value!;
                      if (newDate == true) {
                        filter = "new";
                        // newDate=false;
                        old = false;
                        discount = false;
                        highBrice = false;
                        old = false;
                      }
                    });
                  },
                  sort: S.of(context).newDate,
                ),
                FilterWidget(
                  value: old,
                  onChanged: (value) {
                    setState(() {
                      old = value!;
                      if (old == true) {
                        filter = "old";
                        newDate = false;
                        //old=false;
                        discount = false;
                        highBrice = false;
                        // old=false;
                      }
                    });
                  },
                  sort: S.of(context).old,
                ),
                FilterWidget(
                  value: discount,
                  onChanged: (value) {
                    setState(() {
                      discount = value!;
                      if (old == true) {
                        filter = 'discount';
                        newDate = false;
                        old = false;
                        // discount=false;
                        highBrice = false;
                        old = false;
                      }
                    });
                  },
                  sort: S.of(context).discount,
                ),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.primaryColor,
                    inactiveTrackColor: AppColors.greyColor,
                    trackHeight: 4.0,
                    thumbColor: Colors.pink,

                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
                    rangeThumbShape: RoundRangeSliderThumbShape(
                      enabledThumbRadius: 8,
                    ),
                    showValueIndicator: ShowValueIndicator.never,
                  ),
                  child: RangeSlider(
                    values: currentRangeValues,
                    // labels: RangeLabels(
                    //   '\$${currentRangeValues.start.round()}',
                    //   '\$${currentRangeValues.end.round()}',
                    //
                    // ),
                    min: 0,
                    max: 999,
                    divisions: 100,
                    onChanged: (RangeValues values) {
                      setState(() {
                        currentRangeValues = values;
                      });
                    },
                  ),
                ),
                SizedBox(height: resposiveHeight(25)),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: resposiveWidth(300),
                      height: resposiveHeight(56),
                      child: FloatingActionButton(
                        backgroundColor: AppColors.primaryColor,

                        onPressed: () {
                          if (filter == "0") {
                            Navigator.pop(context);
                            debugPrint('Floating Action Button Pressed!');
                          } else {
                            widget.onChanged(filter);
                            // showFilters(context);
                            Navigator.pop(context);
                            debugPrint('Floating Action Button Pressed!');
                          }
                        },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.filter_list_outlined,
                              color: AppColors.whiteColor,
                              size: resposiveHeight(30),
                            ),
                            SizedBox(width: resposiveWidth(10)),
                            Text(
                              S.of(context).filter,
                              style: AppTextStyles.inter500_16.copyWith(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ), // لون الزر
                      ),
                    ),
                  ],
                ),
                SizedBox(height: resposiveHeight(10)),
              ],
            ),
          ),

          Positioned(
            left:
                ((currentRangeValues.start / 1000) *
                            resposiveWidth(ScreenSizeService.baseWidth - 20) >
                        ((currentRangeValues.end / 1000) *
                                resposiveWidth(
                                  ScreenSizeService.baseWidth - 70,
                                )) -
                            30)
                    ? (((currentRangeValues.end / 1000) *
                            resposiveWidth(ScreenSizeService.baseWidth - 70)) -
                        30)
                    : (currentRangeValues.start / 1000) *
                        resposiveWidth(ScreenSizeService.baseWidth - 20),
            bottom: resposiveHeight(90),
            child: SizedBox(
              width: resposiveWidth(60),
              child: Text(
                '\$${currentRangeValues.start.round().toString()}',
                style: AppTextStyles.inter500_14.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
          Positioned(
            left:
                (currentRangeValues.end / 1000) *
                resposiveWidth(ScreenSizeService.baseWidth - 50),
            bottom: resposiveHeight(90),
            child: SizedBox(
              width: resposiveWidth(60),
              child: Text(
                '\$${currentRangeValues.end.round().toString()}',
                style: AppTextStyles.inter500_14.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
