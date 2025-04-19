import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/core/widgets/custom_validate.dart';
import 'package:flower_app/features/checkout/presentation/cubits/get_addresses_cubit/get_addresses_states.dart';
import 'package:flower_app/features/checkout/presentation/cubits/get_addresses_cubit/get_addresses_view_model.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/address_card_widget.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/delivery_time_widget.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/payment_option_card_widget.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/space_grey_widget.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({
    super.key,
    required this.getAddressesViewModel,
    required this.total,
  });

  final GetAddressesViewModel getAddressesViewModel;
  final List<double> total;

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int selectedAddress = 0;
  int selectedPaymentMethod = 0;
  bool isChecked = true;
  List<int> value = [0, 1];
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    widget.getAddressesViewModel.getAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: resposiveHeight(16)),
        const DeliveryTimeWidget(),
        SizedBox(height: resposiveHeight(16)),
        const SpaceGreyWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
                  child: SizedBox(
                    width: resposiveWidth(343),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: resposiveHeight(16)),
                        Text(
                          "Delivery Address",
                          style: AppTextStyles.inter500_18,
                        ),
                        SizedBox(height: resposiveHeight(8)),
                        BlocBuilder<GetAddressesViewModel, GetAddressesStates>(
                          builder: (context, state) {
                            if (state is GetAddressesSuccessState) {
                              if (state.addresses.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No addresses available",
                                    style: AppTextStyles.inter500_16,
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.addresses.length,
                                  itemBuilder: (context, index) {
                                    return AddressCardWidget(
                                      onChanged: (value) {
                                        setState(() {
                                          selectedPaymentMethod = value!;
                                        });
                                      },
                                      value: value[index],
                                      selectedValue: selectedPaymentMethod,
                                      addressEntity: state.addresses[index],
                                    );
                                  },
                                );
                              }
                            } else if (state is GetAddressesLoadingState) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        SizedBox(height: resposiveHeight(10)),
                        SizedBox(
                          height: resposiveHeight(36),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Color(0xFFA6A6A6)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, color: AppColors.primaryColor),
                                Text(
                                  "  Add new",
                                  style: AppTextStyles.inter500_14.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: resposiveHeight(10)),
                      ],
                    ),
                  ),
                ),
                const SpaceGreyWidget(),
                SizedBox(height: resposiveHeight(16)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
                  child: SizedBox(
                    width: resposiveWidth(343),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment method",
                          style: AppTextStyles.inter500_18,
                        ),
                        SizedBox(height: resposiveHeight(16)),
                        PaymentOptionCardWidget(
                          title: "Cash on delivery",
                          onChanged: (value) {
                            setState(() {
                              selectedAddress = value!;
                            });
                          },
                          value: value[0],
                          selectedValue: selectedAddress,
                        ),
                        SizedBox(height: resposiveHeight(8)),
                        PaymentOptionCardWidget(
                          title: "Credit card",
                          selectedValue: selectedAddress,
                          onChanged: (value) {
                            setState(() {
                              selectedAddress = value!;
                            });
                          },
                          value: value[1],
                        ),
                        SizedBox(height: resposiveHeight(16)),
                      ],
                    ),
                  ),
                ),
                const SpaceGreyWidget(),
                SizedBox(height: resposiveHeight(16)),
                if (selectedAddress == 1)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: resposiveWidth(16),
                    ),
                    child: SizedBox(
                      width: resposiveWidth(343),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Switch(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value;
                                  });
                                },
                                activeColor: AppColors.whiteColor,
                                activeTrackColor: AppColors.primaryColor,
                                inactiveThumbColor: AppColors.whiteColor,
                                inactiveTrackColor: AppColors.greyColor,
                              ),
                              Text(
                                "It is a gift",
                                style: AppTextStyles.inter500_18,
                              ),
                            ],
                          ),
                          if (isChecked)
                            Column(
                              children: [
                                SizedBox(height: resposiveHeight(8)),
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    hintText: 'Enter the name',
                                  ),
                                ),
                                SizedBox(height: resposiveHeight(16)),
                                TextFormField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    hintText: 'Enter the Phone Number',
                                  ),
                                  validator: (value) {
                                    AppValidate.validateMobile(value);
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          SizedBox(height: resposiveHeight(16)),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SpaceGreyWidget(),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: resposiveWidth(16),
                vertical: resposiveHeight(16),
              ),
              child: Column(
                children: [
                  SummaryWidget(total: widget.total),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Place order',
                      style: AppTextStyles.inter500_16.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
