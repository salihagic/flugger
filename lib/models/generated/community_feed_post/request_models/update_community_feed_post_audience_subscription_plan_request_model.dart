import 'package:onedigital_customer/_all.dart';

class UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel {
  final String subscriptionPlanId;

  UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel({
    required this.subscriptionPlanId,
  });

  UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel copyWith({
    String? subscriptionPlanId,
  }) {
    return UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel(
      subscriptionPlanId: subscriptionPlanId ?? this.subscriptionPlanId,
    );
  }

  factory UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateCommunityFeedPostAudienceSubscriptionPlanRequestModel(
      subscriptionPlanId: json.parseValue('subscriptionPlanId'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subscriptionPlanId': subscriptionPlanId,
    };
  }
}
