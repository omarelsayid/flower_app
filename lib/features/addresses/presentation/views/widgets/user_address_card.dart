// // file: user_address_card.dart
// import 'package:flower_app/features/addresses/data/model/user_addresses_dto.dart';
// import 'package:flower_app/features/addresses/domain/entity/user_addresses_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../../../../core/common/get_resposive_height_and_width.dart';
// import '../../../../../core/routes_generator/pages_routes.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_assets.dart';
// import '../../../../../core/utils/text_styles.dart';
// import '../../cubit/user_addresses_cubit/user_addresses_view_model.dart';
//
// class UserAddressCard extends StatelessWidget {
//   final UserAddressesEntity address;
//   final bool isDeleting;
//
//   const UserAddressCard({
//     super.key,
//     required this.address,
//     required this.isDeleting,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, PagesRoutes.userAddressesDetailsScreen, arguments: address);
//       },
//       child: Card(
//         color: AppColors.whiteColor,
//         child: SizedBox(
//           width: resposiveWidth(343),
//           height: resposiveHeight(83),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: resposiveHeight(12),
//               horizontal: resposiveWidth(16),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: resposiveHeight(2)),
//                       child: Icon(Icons.location_on_outlined, size: resposiveWidth(20), color: AppColors.blackColor),
//                     ),
//                     SizedBox(width: resposiveWidth(8)),
//                     Text(
//                       address.city ?? [],
//                       style: AppTextStyles.inter500_16.copyWith(color: AppColors.blackColor),
//                     ),
//                     const Spacer(),
//                     if (isDeleting)
//                       SizedBox(
//                         width: resposiveWidth(24),
//                         height: resposiveHeight(24),
//                         child: CircularProgressIndicator(
//                           strokeWidth: 2,
//                           color: AppColors.primaryColor,
//                         ),
//                       )
//                     else ...[
//                       InkWell(
//                         child: SvgPicture.asset(
//                           SvgImages.deleteIcon,
//                           width: resposiveWidth(24),
//                           height: resposiveHeight(24),
//                         ),
//                         onTap: () => context.read<UserAddressesViewModel>().doIntent(
//                           DeleteUserAddressClickedIntent(address.id!),
//                         ),
//                       ),
//                     ],
//                     SizedBox(width: resposiveWidth(2)),
//                     InkWell(
//                       child: Icon(Icons.edit, color: AppColors.greyDarkColor, size: 20),
//                       onTap: () {
//                         // TODO: فتح شاشة التعديل
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: resposiveHeight(4)),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: resposiveWidth(8)),
//                   child: Row(
//                     children: [
//                       Text(address.lat ?? '', style: AppTextStyles.inter500_13.copyWith(color: AppColors.greyDarkColor)),
//                       Text(" +${address.long ?? ''}", style: AppTextStyles.inter500_13.copyWith(color: AppColors.greyDarkColor)),
//                       Text(" - ${address.street ?? ''}", style: AppTextStyles.inter500_13.copyWith(color: AppColors.greyDarkColor)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
