import 'package:onedigital_customer/_all.dart';

class PayOrderWithStripeRequestModel {
  final bool sepaDebit;
  final String orderId;
  final String? paymentMethodId;
  final String? cardHolderName;
  final String? ipAddress;
  final String? userAgent;

  PayOrderWithStripeRequestModel({
    required this.sepaDebit,
    required this.orderId,
    this.paymentMethodId,
    this.cardHolderName,
    this.ipAddress,
    this.userAgent,
  });

  PayOrderWithStripeRequestModel copyWith({
    bool? sepaDebit,
    String? orderId,
    String? paymentMethodId,
    String? cardHolderName,
    String? ipAddress,
    String? userAgent,
  }) {
    return PayOrderWithStripeRequestModel(
      sepaDebit: sepaDebit ?? this.sepaDebit,
      orderId: orderId ?? this.orderId,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      ipAddress: ipAddress ?? this.ipAddress,
      userAgent: userAgent ?? this.userAgent,
    );
  }

  factory PayOrderWithStripeRequestModel.fromJson(Map<String, dynamic> json) {
    return PayOrderWithStripeRequestModel(
      sepaDebit: json.parseValue('sepaDebit'),
      orderId: json.parseValue('orderId'),
      paymentMethodId: json.parseValue('paymentMethodId'),
      cardHolderName: json.parseValue('cardHolderName'),
      ipAddress: json.parseValue('ipAddress'),
      userAgent: json.parseValue('userAgent'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'sepaDebit': sepaDebit,
      'orderId': orderId,
      'paymentMethodId': paymentMethodId,
      'cardHolderName': cardHolderName,
      'ipAddress': ipAddress,
      'userAgent': userAgent,
    };
  }
}
