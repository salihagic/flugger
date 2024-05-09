import 'package:onedigital_customer/_all.dart';

class CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel {
  final String subscriptionPlanId;

  CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel({
    required this.subscriptionPlanId,
  });

  CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel copyWith({
    String? subscriptionPlanId,
  }) {
    return CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel(
      subscriptionPlanId: subscriptionPlanId ?? this.subscriptionPlanId,
    );
  }

  factory CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateCommunityFeedPostAudienceSubscriptionPlanRequestModel(
      subscriptionPlanId: json.parseValue('subscriptionPlanId'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subscriptionPlanId': subscriptionPlanId,
    };
  }
}
