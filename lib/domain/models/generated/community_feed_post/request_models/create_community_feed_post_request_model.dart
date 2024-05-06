import 'package:onedigital_customer/_all.dart';

class CreateCommunityFeedPostRequestModel {
  final bool isPostedAsTenant;
  final String? title;
  final String? description;
  final CommunityPostAudienceRequestModel audience;
  final bool saveForLater;
  final bool commentsEnabled;
  final bool reactionsEnabled;
  final String? scheduledOnUtc;
  final CreateCommunityFeedPostEventRequestModel event;
  final List<Object>? audienceSubscriptionPlans;
  final List<Object>? mediaItems;

  CreateCommunityFeedPostRequestModel({
    required this.isPostedAsTenant,
    this.title,
    this.description,
    required this.audience,
    required this.saveForLater,
    required this.commentsEnabled,
    required this.reactionsEnabled,
    this.scheduledOnUtc,
    required this.event,
    this.audienceSubscriptionPlans,
    this.mediaItems,
  });

  factory CreateCommunityFeedPostRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateCommunityFeedPostRequestModel(
      isPostedAsTenant: map.parseValue('isPostedAsTenant'),
      title: map.parseValue('title'),
      description: map.parseValue('description'),
      audience: map.parseValue('audience'),
      saveForLater: map.parseValue('saveForLater'),
      commentsEnabled: map.parseValue('commentsEnabled'),
      reactionsEnabled: map.parseValue('reactionsEnabled'),
      scheduledOnUtc: map.parseValue('scheduledOnUtc'),
      event: map.parseValue('event'),
      audienceSubscriptionPlans: map.parseValue('audienceSubscriptionPlans'),
      mediaItems: map.parseValue('mediaItems'),
    );
  }
}
