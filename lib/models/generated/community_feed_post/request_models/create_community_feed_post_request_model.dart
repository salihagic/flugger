import 'package:onedigital_customer/_all.dart';

class CreateCommunityFeedPostRequestModel {
  final bool isPostedAsTenant;
  final String? title;
  final String? description;
  final CommunityPostAudience audience;
  final bool saveForLater;
  final bool commentsEnabled;
  final bool reactionsEnabled;
  final String? scheduledOnUtc;
  final CreateCommunityFeedPostRequestEvent event;
  final UNKNOWN? audienceSubscriptionPlans;
  final UNKNOWN? mediaItems;

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

  CreateCommunityFeedPostRequestModel copyWith({
    bool? isPostedAsTenant,
    String? title,
    String? description,
    CommunityPostAudience? audience,
    bool? saveForLater,
    bool? commentsEnabled,
    bool? reactionsEnabled,
    String? scheduledOnUtc,
    CreateCommunityFeedPostRequestEvent? event,
    UNKNOWN? audienceSubscriptionPlans,
    UNKNOWN? mediaItems,
  }) {
    return CreateCommunityFeedPostRequestModel(
      isPostedAsTenant: isPostedAsTenant ?? this.isPostedAsTenant,
      title: title ?? this.title,
      description: description ?? this.description,
      audience: audience ?? this.audience,
      saveForLater: saveForLater ?? this.saveForLater,
      commentsEnabled: commentsEnabled ?? this.commentsEnabled,
      reactionsEnabled: reactionsEnabled ?? this.reactionsEnabled,
      scheduledOnUtc: scheduledOnUtc ?? this.scheduledOnUtc,
      event: event ?? this.event,
      audienceSubscriptionPlans: audienceSubscriptionPlans ?? this.audienceSubscriptionPlans,
      mediaItems: mediaItems ?? this.mediaItems,
    );
  }

  factory CreateCommunityFeedPostRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateCommunityFeedPostRequestModel(
      isPostedAsTenant: json.parseValue('isPostedAsTenant'),
      title: json.parseValue('title'),
      description: json.parseValue('description'),
      audience: json.parse('audience', CommunityPostAudience.fromJson),
      saveForLater: json.parseValue('saveForLater'),
      commentsEnabled: json.parseValue('commentsEnabled'),
      reactionsEnabled: json.parseValue('reactionsEnabled'),
      scheduledOnUtc: json.parseValue('scheduledOnUtc'),
      event: json.parse('event', CreateCommunityFeedPostRequestEvent.fromJson),
      audienceSubscriptionPlans: json.parseList('audienceSubscriptionPlans'),
      mediaItems: json.parseList('mediaItems'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'isPostedAsTenant': isPostedAsTenant,
      'title': title,
      'description': description,
      'audience': audience,
      'saveForLater': saveForLater,
      'commentsEnabled': commentsEnabled,
      'reactionsEnabled': reactionsEnabled,
      'scheduledOnUtc': scheduledOnUtc,
      'event': event,
      'audienceSubscriptionPlans': audienceSubscriptionPlans,
      'mediaItems': mediaItems,
    };
  }
}
