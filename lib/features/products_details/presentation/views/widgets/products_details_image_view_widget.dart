import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_states.dart';
import 'package:flower_app/features/products_details/presentation/views/widgets/image_indicator_widget.dart';
import 'package:flutter/material.dart';

class ProductsDetailsImageViewWidget extends StatelessWidget {
  const ProductsDetailsImageViewWidget({
    super.key,
    required PageController pageController,
    required this.state,
  }) : _pageController = pageController;

  final PageController _pageController;
  final ProductsDetailSuccess state;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: state.productDetailsEntity.images!.length,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: state.productDetailsEntity.images![index],
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFF9ECF0),
                      value: downloadProgress.progress,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          left: resposiveWidth(155),
          top: resposiveHeight(392),
          child: ImageIndicatorWidget(
            pageController: _pageController,
            state: state,
          ),
        ),
      ],
    );
  }
}
