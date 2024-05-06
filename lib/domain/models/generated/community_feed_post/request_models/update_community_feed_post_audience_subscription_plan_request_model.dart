import 'package:onedigital_customer/_all.dart';

class UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel {
  final String subscriptionPlanId;

  UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel({
    required this.subscriptionPlanId,
  });

  factory UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel(
      subscriptionPlanId: map.parseValue('subscriptionPlanId'),
    );
  }
}
