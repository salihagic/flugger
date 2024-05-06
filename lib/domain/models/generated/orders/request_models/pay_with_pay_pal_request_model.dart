import 'package:onedigital_customer/_all.dart';

class PayWithPayPalRequestModel {
  final String orderId;
  final String? successUrl;
  final String? declineUrl;
  final String? subscriptionId;

  PayWithPayPalRequestModel({
    required this.orderId,
    this.successUrl,
    this.declineUrl,
    this.subscriptionId,
  });

  factory PayWithPayPalRequestModel.fromMap(Map<String, dynamic> map) {
    return PayWithPayPalRequestModel(
      orderId: map.parseValue('orderId'),
      successUrl: map.parseValue('successUrl'),
      declineUrl: map.parseValue('declineUrl'),
      subscriptionId: map.parseValue('subscriptionId'),
    );
  }
}
