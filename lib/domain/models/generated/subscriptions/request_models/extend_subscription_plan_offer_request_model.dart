import 'package:onedigital_customer/_all.dart';

class ExtendSubscriptionPlanOfferRequestModel {
  final String subscriptionPlanId;
  final String offerId;

  ExtendSubscriptionPlanOfferRequestModel({
    required this.subscriptionPlanId,
    required this.offerId,
  });

  factory ExtendSubscriptionPlanOfferRequestModel.fromMap(Map<String, dynamic> map) {
    return ExtendSubscriptionPlanOfferRequestModel(
      subscriptionPlanId: map.parseValue('subscriptionPlanId'),
      offerId: map.parseValue('offerId'),
    );
  }
}
