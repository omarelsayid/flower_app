// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCardResponseModel _$CreditCardResponseModelFromJson(
  Map<String, dynamic> json,
) => CreditCardResponseModel(
  message: json['message'] as String?,
  session:
      json['session'] == null
          ? null
          : SessionResponseModel.fromJson(
            json['session'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$CreditCardResponseModelToJson(
  CreditCardResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'session': instance.session,
};

SessionResponseModel _$SessionResponseModelFromJson(
  Map<String, dynamic> json,
) => SessionResponseModel(
  id: json['id'] as String?,
  object: json['object'] as String?,
  adaptivePricing:
      json['adaptive_pricing'] == null
          ? null
          : AdaptivePricingModel.fromJson(
            json['adaptive_pricing'] as Map<String, dynamic>,
          ),
  amountSubtotal: json['amount_subtotal'] as num?,
  amountTotal: json['amount_total'] as num?,
  automaticTax:
      json['automatic_tax'] == null
          ? null
          : AutomaticTaxModel.fromJson(
            json['automatic_tax'] as Map<String, dynamic>,
          ),
  cancelUrl: json['cancel_url'] as String?,
  clientReferenceId: json['client_reference_id'] as String?,
  created: json['created'] as num?,
  currency: json['currency'] as String?,
  customerCreation: json['customer_creation'] as String?,
  customerDetails:
      json['customer_details'] == null
          ? null
          : CustomerDetailsModel.fromJson(
            json['customer_details'] as Map<String, dynamic>,
          ),
  customerEmail: json['customer_email'] as String?,
  expiresAt: json['expires_at'] as num?,
  invoiceCreation:
      json['invoice_creation'] == null
          ? null
          : InvoiceCreationModel.fromJson(
            json['invoice_creation'] as Map<String, dynamic>,
          ),
  livemode: json['livemode'] as bool?,
  metadata:
      json['metadata'] == null
          ? null
          : SessionLocationModel.fromJson(
            json['metadata'] as Map<String, dynamic>,
          ),
  mode: json['mode'] as String?,
  paymentMethodCollection: json['payment_method_collection'] as String?,
  paymentMethodConfigurationDetails:
      json['payment_method_configuration_details'] == null
          ? null
          : PaymentMethodConfigurationDetailsModel.fromJson(
            json['payment_method_configuration_details']
                as Map<String, dynamic>,
          ),
  paymentMethodOptions:
      json['payment_method_options'] == null
          ? null
          : PaymentMethodOptionsModel.fromJson(
            json['payment_method_options'] as Map<String, dynamic>,
          ),
  paymentMethodTypes:
      (json['payment_method_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  paymentStatus: json['payment_status'] as String?,
  phoneNumberCollection:
      json['phone_number_collection'] == null
          ? null
          : PhoneNumberCollectionModel.fromJson(
            json['phone_number_collection'] as Map<String, dynamic>,
          ),
  status: json['status'] as String?,
  successUrl: json['success_url'] as String?,
  totalDetails:
      json['total_details'] == null
          ? null
          : TotalDetailsSessionModel.fromJson(
            json['total_details'] as Map<String, dynamic>,
          ),
  uiMode: json['ui_mode'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$SessionResponseModelToJson(
  SessionResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'created': instance.created,
  'currency': instance.currency,
  'livemode': instance.livemode,
  'mode': instance.mode,
  'status': instance.status,
  'url': instance.url,
  'adaptive_pricing': instance.adaptivePricing,
  'amount_subtotal': instance.amountSubtotal,
  'amount_total': instance.amountTotal,
  'automatic_tax': instance.automaticTax,
  'cancel_url': instance.cancelUrl,
  'client_reference_id': instance.clientReferenceId,
  'customer_creation': instance.customerCreation,
  'customer_details': instance.customerDetails,
  'customer_email': instance.customerEmail,
  'metadata': instance.metadata,
  'expires_at': instance.expiresAt,
  'invoice_creation': instance.invoiceCreation,
  'payment_method_collection': instance.paymentMethodCollection,
  'payment_method_configuration_details':
      instance.paymentMethodConfigurationDetails,
  'payment_method_options': instance.paymentMethodOptions,
  'payment_method_types': instance.paymentMethodTypes,
  'payment_status': instance.paymentStatus,
  'phone_number_collection': instance.phoneNumberCollection,
  'success_url': instance.successUrl,
  'total_details': instance.totalDetails,
  'ui_mode': instance.uiMode,
};

TotalDetailsSessionModel _$TotalDetailsSessionModelFromJson(
  Map<String, dynamic> json,
) => TotalDetailsSessionModel(
  amountDiscount: json['amount_discount'] as num?,
  amountShipping: json['amount_shipping'] as num?,
  amountTax: json['amount_tax'] as num?,
);

Map<String, dynamic> _$TotalDetailsSessionModelToJson(
  TotalDetailsSessionModel instance,
) => <String, dynamic>{
  'amount_tax': instance.amountTax,
  'amount_shipping': instance.amountShipping,
  'amount_discount': instance.amountDiscount,
};

PhoneNumberCollectionModel _$PhoneNumberCollectionModelFromJson(
  Map<String, dynamic> json,
) => PhoneNumberCollectionModel(enabled: json['enabled'] as bool?);

Map<String, dynamic> _$PhoneNumberCollectionModelToJson(
  PhoneNumberCollectionModel instance,
) => <String, dynamic>{'enabled': instance.enabled};

PaymentMethodOptionsModel _$PaymentMethodOptionsModelFromJson(
  Map<String, dynamic> json,
) => PaymentMethodOptionsModel(
  card:
      json['card'] == null
          ? null
          : CardModel.fromJson(json['card'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaymentMethodOptionsModelToJson(
  PaymentMethodOptionsModel instance,
) => <String, dynamic>{'card': instance.card};

CardModel _$CardModelFromJson(Map<String, dynamic> json) =>
    CardModel(requestThreeDSecure: json['request_three_d_secure'] as String?);

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
  'request_three_d_secure': instance.requestThreeDSecure,
};

PaymentMethodConfigurationDetailsModel
_$PaymentMethodConfigurationDetailsModelFromJson(Map<String, dynamic> json) =>
    PaymentMethodConfigurationDetailsModel(id: json['id'] as String?);

Map<String, dynamic> _$PaymentMethodConfigurationDetailsModelToJson(
  PaymentMethodConfigurationDetailsModel instance,
) => <String, dynamic>{'id': instance.id};

SessionLocationModel _$SessionLocationModelFromJson(
  Map<String, dynamic> json,
) => SessionLocationModel(
  city: json['city'] as String?,
  phone: json['phone'] as String?,
  lat: json['lat'] as String?,
  long: json['long'] as String?,
  street: json['street'] as String?,
);

Map<String, dynamic> _$SessionLocationModelToJson(
  SessionLocationModel instance,
) => <String, dynamic>{
  'city': instance.city,
  'lat': instance.lat,
  'long': instance.long,
  'phone': instance.phone,
  'street': instance.street,
};

InvoiceCreationModel _$InvoiceCreationModelFromJson(
  Map<String, dynamic> json,
) => InvoiceCreationModel(enabled: json['enabled'] as bool?);

Map<String, dynamic> _$InvoiceCreationModelToJson(
  InvoiceCreationModel instance,
) => <String, dynamic>{'enabled': instance.enabled};

CustomerDetailsModel _$CustomerDetailsModelFromJson(
  Map<String, dynamic> json,
) => CustomerDetailsModel(
  email: json['email'] as String?,
  taxExempt: json['tax_exempt'] as String?,
);

Map<String, dynamic> _$CustomerDetailsModelToJson(
  CustomerDetailsModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'tax_exempt': instance.taxExempt,
};

AutomaticTaxModel _$AutomaticTaxModelFromJson(Map<String, dynamic> json) =>
    AutomaticTaxModel(enabled: json['enabled'] as bool?);

Map<String, dynamic> _$AutomaticTaxModelToJson(AutomaticTaxModel instance) =>
    <String, dynamic>{'enabled': instance.enabled};

AdaptivePricingModel _$AdaptivePricingModelFromJson(
  Map<String, dynamic> json,
) => AdaptivePricingModel(enabled: json['enabled'] as bool?);

Map<String, dynamic> _$AdaptivePricingModelToJson(
  AdaptivePricingModel instance,
) => <String, dynamic>{'enabled': instance.enabled};
