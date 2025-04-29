class CreditCardResponseEntity {
  CreditCardResponseEntity({this.message, this.session});

  String? message;
  SessionResponseEntity? session;
}

class SessionResponseEntity {
  SessionResponseEntity({
    this.id,
    this.object,
    this.adaptivePricing,
    this.amountSubtotal,
    this.amountTotal,
    this.automaticTax,
    this.cancelUrl,
    this.clientReferenceId,
    this.created,
    this.currency,
    this.customerCreation,
    this.customerDetails,
    this.customerEmail,
    this.expiresAt,
    this.invoiceCreation,
    this.livemode,
    this.metadata,
    this.mode,
    this.paymentMethodCollection,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.paymentStatus,
    this.phoneNumberCollection,
    this.status,
    this.successUrl,
    this.totalDetails,
    this.uiMode,
    this.url,
  });

  String? id;
  String? object;
  AdaptivePricing? adaptivePricing;

  num? amountSubtotal;
  num? amountTotal;
  AutomaticTax? automaticTax;

  String? cancelUrl;
  String? clientReferenceId;
  num? created;
  String? currency;

  String? customerCreation;
  CustomerDetails? customerDetails;
  String? customerEmail;

  num? expiresAt;

  InvoiceCreation? invoiceCreation;
  bool? livemode;
  SessionLocationEntity? metadata;
  String? mode;
  String? paymentMethodCollection;
  PaymentMethodConfigurationDetailsEntity? paymentMethodConfigurationDetails;
  PaymentMethodOptionsEntity? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  String? paymentStatus;

  PhoneNumberCollectionEntity? phoneNumberCollection;
  String? status;
  String? successUrl;
  TotalDetailsSessionEntity? totalDetails;
  String? uiMode;
  String? url;
}

class TotalDetailsSessionEntity {
  TotalDetailsSessionEntity({this.amountDiscount, this.amountShipping, this.amountTax});

  num? amountDiscount;
  num? amountShipping;
  num? amountTax;
}

class PhoneNumberCollectionEntity {
  PhoneNumberCollectionEntity({this.enabled});

  bool? enabled;
}

class PaymentMethodOptionsEntity {
  PaymentMethodOptionsEntity({this.card});

  CardEntity? card;
}

class CardEntity {
  CardEntity({this.requestThreeDSecure});

  String? requestThreeDSecure;
}

class PaymentMethodConfigurationDetailsEntity {
  PaymentMethodConfigurationDetailsEntity({this.id});

  String? id;
}

class SessionLocationEntity {
  SessionLocationEntity({this.city, this.lat, this.long, this.phone, this.street});

  String? city;
  String? lat;
  String? long;
  String? phone;
  String? street;
}

class InvoiceCreation {
  InvoiceCreation({this.enabled});

  bool? enabled;
}

class CustomerDetails {
  CustomerDetails({this.email, this.taxExempt});

  String? email;
  String? taxExempt;
}

class AutomaticTax {
  AutomaticTax({this.enabled});

  bool? enabled;
}

class AdaptivePricing {
  AdaptivePricing({this.enabled});

  bool? enabled;
}
