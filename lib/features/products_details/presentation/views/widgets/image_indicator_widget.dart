import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_states.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageIndicatorWidget extends StatelessWidget {
  const ImageIndicatorWidget({
    super.key,
    required PageController pageController,
    required this.state,
  }) : _pageController = pageController;

  final PageController _pageController;
  final ProductsDetailSuccess state;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController, // PageController
      count: state.productDetailsEntity.images!.length,
      effect: WormEffect(
        dotHeight: resposiveHeight(10),
        dotWidth: resposiveWidth(10),
        spacing: resposiveWidth(8),
        dotColor: Color(0xfA6A6A6f),
        activeDotColor: AppColors.primaryColor,
      ), // your preferred effect
      onDotClicked: (index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
