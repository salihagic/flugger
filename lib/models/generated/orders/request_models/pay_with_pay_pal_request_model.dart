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

  PayWithPayPalRequestModel copyWith({
    String? orderId,
    String? successUrl,
    String? declineUrl,
    String? subscriptionId,
  }) {
    return PayWithPayPalRequestModel(
      orderId: orderId ?? this.orderId,
      successUrl: successUrl ?? this.successUrl,
      declineUrl: declineUrl ?? this.declineUrl,
      subscriptionId: subscriptionId ?? this.subscriptionId,
    );
  }

  factory PayWithPayPalRequestModel.fromJson(Map<String, dynamic> json) {
    return PayWithPayPalRequestModel(
      orderId: json.parseValue('orderId'),
      successUrl: json.parseValue('successUrl'),
      declineUrl: json.parseValue('declineUrl'),
      subscriptionId: json.parseValue('subscriptionId'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'orderId': orderId,
      'successUrl': successUrl,
      'declineUrl': declineUrl,
      'subscriptionId': subscriptionId,
    };
  }
}
