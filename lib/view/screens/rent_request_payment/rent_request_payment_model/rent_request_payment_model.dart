import 'dart:convert';

RentRequestPaymentModel rentRequestPaymentModelFromJson(String str) => RentRequestPaymentModel.fromJson(json.decode(str));

String rentRequestPaymentModelToJson(RentRequestPaymentModel data) => json.encode(data.toJson());

class RentRequestPaymentModel {
  String? message;
  PaymentData? paymentData;

  RentRequestPaymentModel({
    this.message,
    this.paymentData,
  });

  factory RentRequestPaymentModel.fromJson(Map<String, dynamic> json) => RentRequestPaymentModel(
    message: json["message"],
    paymentData: json["paymentData"] == null ? null : PaymentData.fromJson(json["paymentData"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "paymentData": paymentData?.toJson(),
  };
}

class PaymentData {
  String? id;
  String? object;
  int? amount;
  int? amountCaptured;
  int? amountRefunded;
  dynamic application;
  dynamic applicationFee;
  dynamic applicationFeeAmount;
  String? balanceTransaction;
  BillingDetails? billingDetails;
  String? calculatedStatementDescriptor;
  bool? captured;
  int? created;
  String? currency;
  String? customer;
  String? description;
  dynamic destination;
  dynamic dispute;
  bool? disputed;
  dynamic failureBalanceTransaction;
  dynamic failureCode;
  dynamic failureMessage;
  FraudDetails? fraudDetails;
  dynamic invoice;
  bool? livemode;
  FraudDetails? metadata;
  dynamic onBehalfOf;
  dynamic order;
  Outcome? outcome;
  bool? paid;
  dynamic paymentIntent;
  String? paymentMethod;
  PaymentMethodDetails? paymentMethodDetails;
  String? receiptEmail;
  dynamic receiptNumber;
  String? receiptUrl;
  bool? refunded;
  dynamic review;
  Shipping? shipping;
  Source? source;
  dynamic sourceTransfer;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentData({
    this.id,
    this.object,
    this.amount,
    this.amountCaptured,
    this.amountRefunded,
    this.application,
    this.applicationFee,
    this.applicationFeeAmount,
    this.balanceTransaction,
    this.billingDetails,
    this.calculatedStatementDescriptor,
    this.captured,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.destination,
    this.dispute,
    this.disputed,
    this.failureBalanceTransaction,
    this.failureCode,
    this.failureMessage,
    this.fraudDetails,
    this.invoice,
    this.livemode,
    this.metadata,
    this.onBehalfOf,
    this.order,
    this.outcome,
    this.paid,
    this.paymentIntent,
    this.paymentMethod,
    this.paymentMethodDetails,
    this.receiptEmail,
    this.receiptNumber,
    this.receiptUrl,
    this.refunded,
    this.review,
    this.shipping,
    this.source,
    this.sourceTransfer,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
    id: json["id"],
    object: json["object"],
    amount: json["amount"],
    amountCaptured: json["amount_captured"],
    amountRefunded: json["amount_refunded"],
    application: json["application"],
    applicationFee: json["application_fee"],
    applicationFeeAmount: json["application_fee_amount"],
    balanceTransaction: json["balance_transaction"],
    billingDetails: json["billing_details"] == null ? null : BillingDetails.fromJson(json["billing_details"]),
    calculatedStatementDescriptor: json["calculated_statement_descriptor"],
    captured: json["captured"],
    created: json["created"],
    currency: json["currency"],
    customer: json["customer"],
    description: json["description"],
    destination: json["destination"],
    dispute: json["dispute"],
    disputed: json["disputed"],
    failureBalanceTransaction: json["failure_balance_transaction"],
    failureCode: json["failure_code"],
    failureMessage: json["failure_message"],
    fraudDetails: json["fraud_details"] == null ? null : FraudDetails.fromJson(json["fraud_details"]),
    invoice: json["invoice"],
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? null : FraudDetails.fromJson(json["metadata"]),
    onBehalfOf: json["on_behalf_of"],
    order: json["order"],
    outcome: json["outcome"] == null ? null : Outcome.fromJson(json["outcome"]),
    paid: json["paid"],
    paymentIntent: json["payment_intent"],
    paymentMethod: json["payment_method"],
    paymentMethodDetails: json["payment_method_details"] == null ? null : PaymentMethodDetails.fromJson(json["payment_method_details"]),
    receiptEmail: json["receipt_email"],
    receiptNumber: json["receipt_number"],
    receiptUrl: json["receipt_url"],
    refunded: json["refunded"],
    review: json["review"],
    shipping: json["shipping"] == null ? null : Shipping.fromJson(json["shipping"]),
    source: json["source"] == null ? null : Source.fromJson(json["source"]),
    sourceTransfer: json["source_transfer"],
    statementDescriptor: json["statement_descriptor"],
    statementDescriptorSuffix: json["statement_descriptor_suffix"],
    status: json["status"],
    transferData: json["transfer_data"],
    transferGroup: json["transfer_group"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "amount": amount,
    "amount_captured": amountCaptured,
    "amount_refunded": amountRefunded,
    "application": application,
    "application_fee": applicationFee,
    "application_fee_amount": applicationFeeAmount,
    "balance_transaction": balanceTransaction,
    "billing_details": billingDetails?.toJson(),
    "calculated_statement_descriptor": calculatedStatementDescriptor,
    "captured": captured,
    "created": created,
    "currency": currency,
    "customer": customer,
    "description": description,
    "destination": destination,
    "dispute": dispute,
    "disputed": disputed,
    "failure_balance_transaction": failureBalanceTransaction,
    "failure_code": failureCode,
    "failure_message": failureMessage,
    "fraud_details": fraudDetails?.toJson(),
    "invoice": invoice,
    "livemode": livemode,
    "metadata": metadata?.toJson(),
    "on_behalf_of": onBehalfOf,
    "order": order,
    "outcome": outcome?.toJson(),
    "paid": paid,
    "payment_intent": paymentIntent,
    "payment_method": paymentMethod,
    "payment_method_details": paymentMethodDetails?.toJson(),
    "receipt_email": receiptEmail,
    "receipt_number": receiptNumber,
    "receipt_url": receiptUrl,
    "refunded": refunded,
    "review": review,
    "shipping": shipping?.toJson(),
    "source": source?.toJson(),
    "source_transfer": sourceTransfer,
    "statement_descriptor": statementDescriptor,
    "statement_descriptor_suffix": statementDescriptorSuffix,
    "status": status,
    "transfer_data": transferData,
    "transfer_group": transferGroup,
  };
}

class BillingDetails {
  Address? address;
  dynamic email;
  dynamic name;
  dynamic phone;

  BillingDetails({
    this.address,
    this.email,
    this.name,
    this.phone,
  });

  factory BillingDetails.fromJson(Map<String, dynamic> json) => BillingDetails(
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    email: json["email"],
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "address": address?.toJson(),
    "email": email,
    "name": name,
    "phone": phone,
  };
}

class Address {
  dynamic city;
  String? country;
  dynamic line1;
  dynamic line2;
  dynamic postalCode;
  dynamic state;

  Address({
    this.city,
    this.country,
    this.line1,
    this.line2,
    this.postalCode,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    country: json["country"],
    line1: json["line1"],
    line2: json["line2"],
    postalCode: json["postal_code"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
    "line1": line1,
    "line2": line2,
    "postal_code": postalCode,
    "state": state,
  };
}

class FraudDetails {
  FraudDetails();

  factory FraudDetails.fromJson(Map<String, dynamic> json) => FraudDetails(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Outcome {
  String? networkStatus;
  dynamic reason;
  String? riskLevel;
  int? riskScore;
  String? sellerMessage;
  String? type;

  Outcome({
    this.networkStatus,
    this.reason,
    this.riskLevel,
    this.riskScore,
    this.sellerMessage,
    this.type,
  });

  factory Outcome.fromJson(Map<String, dynamic> json) => Outcome(
    networkStatus: json["network_status"],
    reason: json["reason"],
    riskLevel: json["risk_level"],
    riskScore: json["risk_score"],
    sellerMessage: json["seller_message"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "network_status": networkStatus,
    "reason": reason,
    "risk_level": riskLevel,
    "risk_score": riskScore,
    "seller_message": sellerMessage,
    "type": type,
  };
}

class PaymentMethodDetails {
  Card? card;
  String? type;

  PaymentMethodDetails({
    this.card,
    this.type,
  });

  factory PaymentMethodDetails.fromJson(Map<String, dynamic> json) => PaymentMethodDetails(
    card: json["card"] == null ? null : Card.fromJson(json["card"]),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "card": card?.toJson(),
    "type": type,
  };
}

class Card {
  int? amountAuthorized;
  String? brand;
  Checks? checks;
  String? country;
  int? expMonth;
  int? expYear;
  ExtendedAuthorization? extendedAuthorization;
  String? fingerprint;
  String? funding;
  ExtendedAuthorization? incrementalAuthorization;
  dynamic installments;
  String? last4;
  dynamic mandate;
  ExtendedAuthorization? multicapture;
  String? network;
  NetworkToken? networkToken;
  Overcapture? overcapture;
  dynamic threeDSecure;
  dynamic wallet;

  Card({
    this.amountAuthorized,
    this.brand,
    this.checks,
    this.country,
    this.expMonth,
    this.expYear,
    this.extendedAuthorization,
    this.fingerprint,
    this.funding,
    this.incrementalAuthorization,
    this.installments,
    this.last4,
    this.mandate,
    this.multicapture,
    this.network,
    this.networkToken,
    this.overcapture,
    this.threeDSecure,
    this.wallet,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    amountAuthorized: json["amount_authorized"],
    brand: json["brand"],
    checks: json["checks"] == null ? null : Checks.fromJson(json["checks"]),
    country: json["country"],
    expMonth: json["exp_month"],
    expYear: json["exp_year"],
    extendedAuthorization: json["extended_authorization"] == null ? null : ExtendedAuthorization.fromJson(json["extended_authorization"]),
    fingerprint: json["fingerprint"],
    funding: json["funding"],
    incrementalAuthorization: json["incremental_authorization"] == null ? null : ExtendedAuthorization.fromJson(json["incremental_authorization"]),
    installments: json["installments"],
    last4: json["last4"],
    mandate: json["mandate"],
    multicapture: json["multicapture"] == null ? null : ExtendedAuthorization.fromJson(json["multicapture"]),
    network: json["network"],
    networkToken: json["network_token"] == null ? null : NetworkToken.fromJson(json["network_token"]),
    overcapture: json["overcapture"] == null ? null : Overcapture.fromJson(json["overcapture"]),
    threeDSecure: json["three_d_secure"],
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "amount_authorized": amountAuthorized,
    "brand": brand,
    "checks": checks?.toJson(),
    "country": country,
    "exp_month": expMonth,
    "exp_year": expYear,
    "extended_authorization": extendedAuthorization?.toJson(),
    "fingerprint": fingerprint,
    "funding": funding,
    "incremental_authorization": incrementalAuthorization?.toJson(),
    "installments": installments,
    "last4": last4,
    "mandate": mandate,
    "multicapture": multicapture?.toJson(),
    "network": network,
    "network_token": networkToken?.toJson(),
    "overcapture": overcapture?.toJson(),
    "three_d_secure": threeDSecure,
    "wallet": wallet,
  };
}

class Checks {
  dynamic addressLine1Check;
  dynamic addressPostalCodeCheck;
  String? cvcCheck;

  Checks({
    this.addressLine1Check,
    this.addressPostalCodeCheck,
    this.cvcCheck,
  });

  factory Checks.fromJson(Map<String, dynamic> json) => Checks(
    addressLine1Check: json["address_line1_check"],
    addressPostalCodeCheck: json["address_postal_code_check"],
    cvcCheck: json["cvc_check"],
  );

  Map<String, dynamic> toJson() => {
    "address_line1_check": addressLine1Check,
    "address_postal_code_check": addressPostalCodeCheck,
    "cvc_check": cvcCheck,
  };
}

class ExtendedAuthorization {
  String? status;

  ExtendedAuthorization({
    this.status,
  });

  factory ExtendedAuthorization.fromJson(Map<String, dynamic> json) => ExtendedAuthorization(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

class NetworkToken {
  bool? used;

  NetworkToken({
    this.used,
  });

  factory NetworkToken.fromJson(Map<String, dynamic> json) => NetworkToken(
    used: json["used"],
  );

  Map<String, dynamic> toJson() => {
    "used": used,
  };
}

class Overcapture {
  int? maximumAmountCapturable;
  String? status;

  Overcapture({
    this.maximumAmountCapturable,
    this.status,
  });

  factory Overcapture.fromJson(Map<String, dynamic> json) => Overcapture(
    maximumAmountCapturable: json["maximum_amount_capturable"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "maximum_amount_capturable": maximumAmountCapturable,
    "status": status,
  };
}

class Shipping {
  Address? address;
  dynamic carrier;
  String? name;
  dynamic phone;
  dynamic trackingNumber;

  Shipping({
    this.address,
    this.carrier,
    this.name,
    this.phone,
    this.trackingNumber,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    carrier: json["carrier"],
    name: json["name"],
    phone: json["phone"],
    trackingNumber: json["tracking_number"],
  );

  Map<String, dynamic> toJson() => {
    "address": address?.toJson(),
    "carrier": carrier,
    "name": name,
    "phone": phone,
    "tracking_number": trackingNumber,
  };
}

class Source {
  String? id;
  String? object;
  dynamic addressCity;
  dynamic addressCountry;
  dynamic addressLine1;
  dynamic addressLine1Check;
  dynamic addressLine2;
  dynamic addressState;
  dynamic addressZip;
  dynamic addressZipCheck;
  String? brand;
  String? country;
  String? customer;
  String? cvcCheck;
  dynamic dynamicLast4;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  String? last4;
  FraudDetails? metadata;
  dynamic name;
  dynamic tokenizationMethod;
  dynamic wallet;

  Source({
    this.id,
    this.object,
    this.addressCity,
    this.addressCountry,
    this.addressLine1,
    this.addressLine1Check,
    this.addressLine2,
    this.addressState,
    this.addressZip,
    this.addressZipCheck,
    this.brand,
    this.country,
    this.customer,
    this.cvcCheck,
    this.dynamicLast4,
    this.expMonth,
    this.expYear,
    this.fingerprint,
    this.funding,
    this.last4,
    this.metadata,
    this.name,
    this.tokenizationMethod,
    this.wallet,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    object: json["object"],
    addressCity: json["address_city"],
    addressCountry: json["address_country"],
    addressLine1: json["address_line1"],
    addressLine1Check: json["address_line1_check"],
    addressLine2: json["address_line2"],
    addressState: json["address_state"],
    addressZip: json["address_zip"],
    addressZipCheck: json["address_zip_check"],
    brand: json["brand"],
    country: json["country"],
    customer: json["customer"],
    cvcCheck: json["cvc_check"],
    dynamicLast4: json["dynamic_last4"],
    expMonth: json["exp_month"],
    expYear: json["exp_year"],
    fingerprint: json["fingerprint"],
    funding: json["funding"],
    last4: json["last4"],
    metadata: json["metadata"] == null ? null : FraudDetails.fromJson(json["metadata"]),
    name: json["name"],
    tokenizationMethod: json["tokenization_method"],
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "address_city": addressCity,
    "address_country": addressCountry,
    "address_line1": addressLine1,
    "address_line1_check": addressLine1Check,
    "address_line2": addressLine2,
    "address_state": addressState,
    "address_zip": addressZip,
    "address_zip_check": addressZipCheck,
    "brand": brand,
    "country": country,
    "customer": customer,
    "cvc_check": cvcCheck,
    "dynamic_last4": dynamicLast4,
    "exp_month": expMonth,
    "exp_year": expYear,
    "fingerprint": fingerprint,
    "funding": funding,
    "last4": last4,
    "metadata": metadata?.toJson(),
    "name": name,
    "tokenization_method": tokenizationMethod,
    "wallet": wallet,
  };
}
