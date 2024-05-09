import 'package:onedigital_customer/_all.dart';

class ExtendSubscriptionPlanOfferRequestModel {
  final String subscriptionPlanId;
  final String offerId;

  ExtendSubscriptionPlanOfferRequestModel({
    required this.subscriptionPlanId,
    required this.offerId,
  });

  ExtendSubscriptionPlanOfferRequestModel copyWith({
    String? subscriptionPlanId,
    String? offerId,
  }) {
    return ExtendSubscriptionPlanOfferRequestModel(
      subscriptionPlanId: subscriptionPlanId ?? this.subscriptionPlanId,
      offerId: offerId ?? this.offerId,
    );
  }

  factory ExtendSubscriptionPlanOfferRequestModel.fromJson(Map<String, dynamic> json) {
    return ExtendSubscriptionPlanOfferRequestModel(
      subscriptionPlanId: json.parseValue('subscriptionPlanId'),
      offerId: json.parseValue('offerId'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subscriptionPlanId': subscriptionPlanId,
      'offerId': offerId,
    };
  }
}
