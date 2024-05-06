import 'package:onedigital_customer/_all.dart';

class CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel {
  final String subscriptionPlanId;

  CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel({
    required this.subscriptionPlanId,
  });

  factory CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel(
      subscriptionPlanId: map.parseValue('subscriptionPlanId'),
    );
  }
}
