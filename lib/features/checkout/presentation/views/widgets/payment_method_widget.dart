// import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
// import 'package:flower_app/core/utils/text_styles.dart';
// import 'package:flower_app/features/checkout/presentation/views/widgets/payment_option_card_widget.dart';
// import 'package:flutter/material.dart';
//
// class PaymentMethodWidget extends StatefulWidget {
//   const PaymentMethodWidget({super.key});
//
//   @override
//   State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
// }
//
// class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
//   int selectedValue = 0;
//
//   List<int> value = [0, 1];
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
//       child: SizedBox(
//         width: resposiveWidth(343),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Payment method", style: AppTextStyles.inter500_18),
//             SizedBox(height: resposiveHeight(16)),
//             PaymentOptionCardWidget(
//               onChanged: (value) {
//                 setState(() {
//                   selectedValue = value!;
//                 });
//               },
//               value: value[0], selectedValue: selectedValue,
//             ),
//             SizedBox(height: resposiveHeight(8)),
//             PaymentOptionCardWidget(
//               selectedValue: selectedValue,
//               onChanged: (value) {
//                 setState(() {
//                   selectedValue = value!;
//                 });
//               },
//               value: value[1],
//             ),
//             SizedBox(height: resposiveHeight(16)),
//           ],
//         ),
//       ),
//     );
//   }
// }
