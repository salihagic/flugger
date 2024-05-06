import 'package:onedigital_customer/_all.dart';

class UpdateCommunityFeedPostRequestModel {
  final String? title;
  final String? description;
  final bool isPostedAsTenant;
  final CommunityPostAudienceRequestModel audience;
  final bool saveForLater;
  final bool commentsEnabled;
  final bool reactionsEnabled;
  final UpdateCommunityFeedPostEventRequestModel event;
  final List<Object>? audienceSubscriptionPlans;
  final List<Object>? mediaItems;

  UpdateCommunityFeedPostRequestModel({
    this.title,
    this.description,
    required this.isPostedAsTenant,
    required this.audience,
    required this.saveForLater,
    required this.commentsEnabled,
    required this.reactionsEnabled,
    required this.event,
    this.audienceSubscriptionPlans,
    this.mediaItems,
  });

  factory UpdateCommunityFeedPostRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateCommunityFeedPostRequestModel(
      title: map.parseValue('title'),
      description: map.parseValue('description'),
      isPostedAsTenant: map.parseValue('isPostedAsTenant'),
      audience: map.parseValue('audience'),
      saveForLater: map.parseValue('saveForLater'),
      commentsEnabled: map.parseValue('commentsEnabled'),
      reactionsEnabled: map.parseValue('reactionsEnabled'),
      event: map.parseValue('event'),
      audienceSubscriptionPlans: map.parseValue('audienceSubscriptionPlans'),
      mediaItems: map.parseValue('mediaItems'),
    );
  }
}
