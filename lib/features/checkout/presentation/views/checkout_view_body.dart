import 'dart:developer';

import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/core/widgets/custom_validate.dart';
import 'package:flower_app/features/checkout/data/model/credit_card_request_model.dart';
import 'package:flower_app/features/checkout/domain/entites/addresses_response_entity.dart';
import 'package:flower_app/features/checkout/presentation/cubits/checkout_cubit/checkout_view_model.dart';
import 'package:flower_app/features/checkout/presentation/cubits/get_addresses_cubit/get_addresses_states.dart';
import 'package:flower_app/features/checkout/presentation/cubits/get_addresses_cubit/get_addresses_view_model.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/address_card_widget.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/delivery_time_widget.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/payment_option_card_widget.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/space_grey_widget.dart';
import 'package:flower_app/features/checkout/presentation/views/widgets/summary_widget.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../cubits/checkout_cubit/checkout_state.dart';

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
  List<AddressEntity> addresses = [];

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
                          S.of(context).deliveryAddress,
                          style: AppTextStyles.inter500_18,
                        ),
                        SizedBox(height: resposiveHeight(8)),
                        BlocConsumer<GetAddressesViewModel, GetAddressesStates>(
                          listener: (context, state) {
                            if (state is GetAddressesErrorState) {
                              log('error');
                              EasyLoading.dismiss();
                              EasyLoading.showError(state.error);
                            }
                          },
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
                                return ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.addresses.length,
                                  itemBuilder: (context, index) {
                                    addresses = state.addresses;
                                    return AddressCardWidget(
                                      onChanged: (value) {
                                        setState(() {
                                          selectedAddress = value!;
                                        });
                                      },
                                      value: index,
                                      selectedValue: selectedAddress,
                                      addressEntity: state.addresses[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: resposiveHeight(10),
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
                                  "  ${S.of(context).addNew}",
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
                          S.of(context).paymentMethod,
                          style: AppTextStyles.inter500_18,
                        ),
                        SizedBox(height: resposiveHeight(16)),
                        PaymentOptionCardWidget(
                          title: S.of(context).cashOnDelivery,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value!;
                            });
                          },
                          value: value[0],
                          selectedValue: selectedPaymentMethod,
                        ),
                        SizedBox(height: resposiveHeight(8)),
                        PaymentOptionCardWidget(
                          title: S.of(context).creditCard,
                          selectedValue: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value!;
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
                if (selectedPaymentMethod == 1)
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
                                S.of(context).itIsAGift,
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
                                    labelText: S.of(context).name,
                                    hintText: S.of(context).enterYourName,
                                  ),
                                ),
                                SizedBox(height: resposiveHeight(16)),
                                TextFormField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    labelText: S.of(context).phoneNumber,
                                    hintText: S.of(context).enterPhoneNumber,
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
              child: BlocListener<CheckoutViewModel, CheckoutState>(
                listener: (context, state) {
                  if (state is CheckoutCashLoadingState) {
                    EasyLoading.show();
                  }
                  if (state is CheckoutCashSuccessState) {
                    EasyLoading.dismiss();
                    Navigator.pushNamed(context, PagesRoutes.paymentScreen);
                  }
                  if (state is CheckoutCashErrorState) {
                    EasyLoading.dismiss();
                    EasyLoading.showError(state.errMessage);
                  }
                  if (state is CheckoutCreditLoadingState) {
                    EasyLoading.show();
                  }
                  if (state is CheckoutCreditSuccessState) {
                    EasyLoading.dismiss();
                  }
                  if (state is CheckoutCreditErrorState) {
                    EasyLoading.dismiss();
                    EasyLoading.showError(state.errMessage);
                  }
                },
                child: Column(
                  children: [
                    SummaryWidget(total: widget.total),
                    ElevatedButton(
                      onPressed: () {
                        if (addresses.isEmpty) {
                          EasyLoading.showError(
                            "Please add your address",
                            duration: Duration(seconds: 2),
                          );
                        } else {
                          selectedPaymentMethod == 0
                              ? {
                                getIt.get<CheckoutViewModel>().doIntent(
                                  CheckoutCashIntent(
                                    CreditCardRequestModel(
                                      shippingAddress: ShippingAddress(
                                        long: addresses[selectedAddress].long,
                                        lat: addresses[selectedAddress].lat,
                                        city: addresses[selectedAddress].city,
                                        phone: addresses[selectedAddress].phone,
                                        street:
                                            addresses[selectedAddress].street,
                                      ),
                                    ),
                                  ),
                                ),
                                Navigator.pushNamed(
                                  context,
                                  PagesRoutes.paymentScreen,
                                ),
                              }
                              : {
                                getIt.get<CheckoutViewModel>().doIntent(
                                  CheckoutCreditIntent(
                                    CreditCardRequestModel(
                                      shippingAddress: ShippingAddress(
                                        long: addresses[selectedAddress].long,
                                        lat: addresses[selectedAddress].lat,
                                        city: addresses[selectedAddress].city,
                                        phone: addresses[selectedAddress].phone,
                                        street:
                                            addresses[selectedAddress].street,
                                      ),
                                    )
                                  ),
                                ),
                              };
                        }
                      },
                      child: Text(
                        S.of(context).placeOrder,
                        style: AppTextStyles.inter500_16.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
