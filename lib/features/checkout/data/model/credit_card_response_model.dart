import 'package:flower_app/features/checkout/domain/entites/credit_card_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credit_card_response_model.g.dart';

@JsonSerializable()
class CreditCardResponseModel extends CreditCardResponseEntity {
  CreditCardResponseModel({super.message, this.session});

  @JsonKey(name: "session")
  final SessionResponseModel? session;

  factory CreditCardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardResponseModelFromJson(json);
}

@JsonSerializable()
class SessionResponseModel extends SessionResponseEntity {
  SessionResponseModel({
    super.id,
    super.object,
    this.adaptivePricing,
    this.amountSubtotal,
    this.amountTotal,
    this.automaticTax,
    this.cancelUrl,
    this.clientReferenceId,
    super.created,
    super.currency,
    this.customerCreation,
    this.customerDetails,
    this.customerEmail,
    this.expiresAt,
    this.invoiceCreation,
    super.livemode,
    this.metadata,
    super.mode,
    this.paymentMethodCollection,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.paymentStatus,
    this.phoneNumberCollection,
    super.status,
    this.successUrl,
    this.totalDetails,
    this.uiMode,
    super.url,
  });

  @JsonKey(name: "adaptive_pricing")
  final AdaptivePricingModel? adaptivePricing;
  @JsonKey(name: "amount_subtotal")
  final num? amountSubtotal;
  @JsonKey(name: "amount_total")
  final num? amountTotal;
  @JsonKey(name: "automatic_tax")
  final AutomaticTaxModel? automaticTax;
  @JsonKey(name: "cancel_url")
  final String? cancelUrl;
  @JsonKey(name: "client_reference_id")
  final String? clientReferenceId;
  @JsonKey(name: "customer_creation")
  final String? customerCreation;
  @JsonKey(name: "customer_details")
  final CustomerDetailsModel? customerDetails;
  @JsonKey(name: "customer_email")
  final String? customerEmail;
  @JsonKey(name: "metadata")
  final SessionLocationModel? metadata;
  @JsonKey(name: "expires_at")
  final num? expiresAt;
  @JsonKey(name: "invoice_creation")
  final InvoiceCreationModel? invoiceCreation;
  @JsonKey(name: "payment_method_collection")
  final String? paymentMethodCollection;
  @JsonKey(name: "payment_method_configuration_details")
  final PaymentMethodConfigurationDetailsModel?
  paymentMethodConfigurationDetails;
  @JsonKey(name: "payment_method_options")
  final PaymentMethodOptionsModel? paymentMethodOptions;
  @JsonKey(name: "payment_method_types")
  final List<String>? paymentMethodTypes;
  @JsonKey(name: "payment_status")
  final String? paymentStatus;
  @JsonKey(name: "phone_number_collection")
  final PhoneNumberCollectionModel? phoneNumberCollection;
  @JsonKey(name: "success_url")
  final String? successUrl;
  @JsonKey(name: "total_details")
  final TotalDetailsSessionModel? totalDetails;
  @JsonKey(name: "ui_mode")
  final String? uiMode;

  factory SessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseModelFromJson(json);
}

@JsonSerializable()
class TotalDetailsSessionModel extends TotalDetailsSessionEntity {
  TotalDetailsSessionModel({
    this.amountDiscount,
    this.amountShipping,
    this.amountTax,
  });

  @JsonKey(name: "amount_tax")
  final num? amountTax;
  @JsonKey(name: "amount_shipping")
  final num? amountShipping;
  @JsonKey(name: "amount_discount")
  final num? amountDiscount;

  factory TotalDetailsSessionModel.fromJson(Map<String, dynamic> json) =>
      _$TotalDetailsSessionModelFromJson(json);
}

@JsonSerializable()
class PhoneNumberCollectionModel extends PhoneNumberCollectionEntity {
  PhoneNumberCollectionModel({super.enabled});

  factory PhoneNumberCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberCollectionModelFromJson(json);
}

@JsonSerializable()
class PaymentMethodOptionsModel extends PaymentMethodOptionsEntity {
  PaymentMethodOptionsModel({this.card});

  @JsonKey(name: "card")
  final CardModel? card;

  factory PaymentMethodOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodOptionsModelFromJson(json);
}

@JsonSerializable()
class CardModel extends CardEntity {
  CardModel({this.requestThreeDSecure});

  @JsonKey(name: "request_three_d_secure")
  final String? requestThreeDSecure;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}

@JsonSerializable()
class PaymentMethodConfigurationDetailsModel
    extends PaymentMethodConfigurationDetailsEntity {
  PaymentMethodConfigurationDetailsModel({super.id});

  factory PaymentMethodConfigurationDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) => _$PaymentMethodConfigurationDetailsModelFromJson(json);
}

@JsonSerializable()
class SessionLocationModel extends SessionLocationEntity {
  SessionLocationModel({
    super.city,
    super.phone,
    super.lat,
    super.long,
    super.street,
  });

  factory SessionLocationModel.fromJson(Map<String, dynamic> json) =>
      _$SessionLocationModelFromJson(json);
}

@JsonSerializable()
class InvoiceCreationModel extends InvoiceCreation {
  InvoiceCreationModel({super.enabled});

  factory InvoiceCreationModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceCreationModelFromJson(json);
}

@JsonSerializable()
class CustomerDetailsModel extends CustomerDetails {
  CustomerDetailsModel({super.email, this.taxExempt});

  @JsonKey(name: "tax_exempt")
  final String? taxExempt;

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsModelFromJson(json);
}

@JsonSerializable()
class AutomaticTaxModel extends AutomaticTax {
  AutomaticTaxModel({super.enabled});

  factory AutomaticTaxModel.fromJson(Map<String, dynamic> json) =>
      _$AutomaticTaxModelFromJson(json);
}

@JsonSerializable()
class AdaptivePricingModel extends AdaptivePricing {
  AdaptivePricingModel({super.enabled});

  factory AdaptivePricingModel.fromJson(Map<String, dynamic> json) =>
      _$AdaptivePricingModelFromJson(json);
}
