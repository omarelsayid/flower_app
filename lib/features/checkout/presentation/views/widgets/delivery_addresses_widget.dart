// import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
// import 'package:flower_app/core/utils/app_colors.dart';
// import 'package:flower_app/core/utils/text_styles.dart';
// import 'package:flower_app/features/checkout/presentation/views/widgets/address_card_widget.dart';
// import 'package:flutter/material.dart';
//
// class DeliveryAddressesWidget extends StatefulWidget {
//   const DeliveryAddressesWidget({super.key});
//
//   @override
//   State<DeliveryAddressesWidget> createState() =>
//       _DeliveryAddressesWidgetState();
// }
//
// class _DeliveryAddressesWidgetState extends State<DeliveryAddressesWidget> {
//   int selectedValue = 0;
//   List<int> value = [0, 1];
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
//       child: SizedBox(
//         width: resposiveWidth(343),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: resposiveHeight(16)),
//             Text("Delivery Address", style: AppTextStyles.inter500_18),
//             SizedBox(height: resposiveHeight(8)),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: value.length,
//               itemBuilder: (context,index){
//                 return AddressCardWidget(
//                   onChanged: (value) {
//                     setState(() {
//                       selectedValue = value!;
//                     });
//                   },
//                   value: value[index],
//                   selectedValue: selectedValue,
//                 );
//               },
//             ),
//             SizedBox(height: resposiveHeight(8)),
//             // AddressCardWidget(
//             //   onChanged: (value) {
//             //     setState(() {
//             //       selectedValue = value!;
//             //     });
//             //   },
//             //   value: 2,
//             //   selectedValue: selectedValue,
//             // ),
//             SizedBox(height: resposiveHeight(10)),
//             SizedBox(
//               height: resposiveHeight(36),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   side: BorderSide(color: Color(0xFFA6A6A6)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.add, color: AppColors.primaryColor),
//                     Text(
//                       "  Add new",
//                       style: AppTextStyles.inter500_14.copyWith(
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: resposiveHeight(10)),
//           ],
//         ),
//       ),
//     );
//   }
// }
