import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/products_details/presentation/cubits/product_details_cubit/products_detail_states.dart';
import 'package:flutter/material.dart';

class CollapsedSliverAppBarWidget extends StatelessWidget {
  const CollapsedSliverAppBarWidget({
    super.key,
    required this.state,
  });

  final ProductsDetailSuccess state;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    
        Expanded(
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            state.productDetailsEntity.slug!,
            style: AppTextStyles.inter500_20.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
