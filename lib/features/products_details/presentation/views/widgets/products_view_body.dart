import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_states.dart';
import 'package:flower_app/features/products_details/presentation/views/widgets/products_details_image_view_widget.dart';
import 'package:flower_app/features/products_details/presentation/views/widgets/review_text_widget.dart';
import 'package:flutter/material.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({
    required this.state,

    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;
  final ProductsDetailSuccess state;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // leadingWidth: resposiveWidth(20),
          // titleSpacing: 100,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          pinned: true,
          floating: true,
          expandedHeight: resposiveHeight(400),
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              // * cacluating how much the app bar is collapsed based on its height

              double collapsePercentage =
                  (constraints.maxHeight) / (resposiveHeight(400));
              bool isCollapsed = collapsePercentage < 0.3;

              return FlexibleSpaceBar(
                title:
                    isCollapsed
                        ? Row(
                          children: [
                            SizedBox(
                              height: resposiveHeight(35),
                              child: CachedNetworkImage(
                                imageUrl: state.productDetailsEntity.imgCover!,
                                imageBuilder:
                                    (context, imageProvider) => Image.network(
                                      state.productDetailsEntity.imgCover!,
                                    ),
                                fadeInDuration: const Duration(
                                  milliseconds: 600,
                                ),
                                fadeInCurve: Curves.easeInCubic,
                              ),
                            ),
                            SizedBox(width: resposiveWidth(8)),

                            Text(
                              state.productDetailsEntity.slug!,
                              style: AppTextStyles.inter500_20.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                        : null,
                background: ProductsDetailsImageViewWidget(
                  pageController: _pageController,
                  state: state,
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: resposiveWidth(16),
              right: resposiveWidth(16),
              top: resposiveWidth(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP ${state.productDetailsEntity.priceAfterDiscount!}',
                      style: AppTextStyles.inter700_20,
                    ),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.inter400_14.copyWith(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Status: ',
                            style:
                                AppTextStyles
                                    .inter500_16, // Bold style for "Status:"
                          ),
                          TextSpan(
                            text:
                                '${state.productDetailsEntity.quantity} in stock',
                            style: AppTextStyles.inter400_14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: resposiveHeight(4)),
                Text(
                  'All prices include tax',
                  style: AppTextStyles.inter400_14.copyWith(
                    color: Color(0xff535353),
                  ),
                ),

                SizedBox(height: resposiveHeight(8)),
                Text('15 Pink Rose Bouquet', style: AppTextStyles.inter500_16),

                SizedBox(height: resposiveHeight(16)),

                Text('Description', style: AppTextStyles.inter500_16),
                SizedBox(height: resposiveHeight(8)),
                Text(
                  state.productDetailsEntity.description!,
                  style: AppTextStyles.inter400_14,
                ),

                SizedBox(height: resposiveHeight(24)),

                ReviewTextWidget(state: state),
                SizedBox(height: resposiveHeight(35)),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Add to cart',
                    style: AppTextStyles.inter500_16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),

                // * this containers for test the scrolling
                Container(height: resposiveHeight(300)),
                Container(height: resposiveHeight(300)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
