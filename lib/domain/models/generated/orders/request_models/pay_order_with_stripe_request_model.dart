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

  factory PayOrderWithStripeRequestModel.fromMap(Map<String, dynamic> map) {
    return PayOrderWithStripeRequestModel(
      sepaDebit: map.parseValue('sepaDebit'),
      orderId: map.parseValue('orderId'),
      paymentMethodId: map.parseValue('paymentMethodId'),
      cardHolderName: map.parseValue('cardHolderName'),
      ipAddress: map.parseValue('ipAddress'),
      userAgent: map.parseValue('userAgent'),
    );
  }
}
