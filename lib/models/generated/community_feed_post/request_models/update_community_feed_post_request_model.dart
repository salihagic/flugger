import 'package:onedigital_customer/_all.dart';

class UpdateCommunityFeedPostRequestModel {
  final String? title;
  final String? description;
  final bool isPostedAsTenant;
  final CommunityPostAudience audience;
  final bool saveForLater;
  final bool commentsEnabled;
  final bool reactionsEnabled;
  final UpdateCommunityFeedPostRequestEvent event;
  final UNKNOWN? audienceSubscriptionPlans;
  final UNKNOWN? mediaItems;

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

  UpdateCommunityFeedPostRequestModel copyWith({
    String? title,
    String? description,
    bool? isPostedAsTenant,
    CommunityPostAudience? audience,
    bool? saveForLater,
    bool? commentsEnabled,
    bool? reactionsEnabled,
    UpdateCommunityFeedPostRequestEvent? event,
    UNKNOWN? audienceSubscriptionPlans,
    UNKNOWN? mediaItems,
  }) {
    return UpdateCommunityFeedPostRequestModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isPostedAsTenant: isPostedAsTenant ?? this.isPostedAsTenant,
      audience: audience ?? this.audience,
      saveForLater: saveForLater ?? this.saveForLater,
      commentsEnabled: commentsEnabled ?? this.commentsEnabled,
      reactionsEnabled: reactionsEnabled ?? this.reactionsEnabled,
      event: event ?? this.event,
      audienceSubscriptionPlans: audienceSubscriptionPlans ?? this.audienceSubscriptionPlans,
      mediaItems: mediaItems ?? this.mediaItems,
    );
  }

  factory UpdateCommunityFeedPostRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateCommunityFeedPostRequestModel(
      title: json.parseValue('title'),
      description: json.parseValue('description'),
      isPostedAsTenant: json.parseValue('isPostedAsTenant'),
      audience: json.parse('audience', CommunityPostAudience.fromJson),
      saveForLater: json.parseValue('saveForLater'),
      commentsEnabled: json.parseValue('commentsEnabled'),
      reactionsEnabled: json.parseValue('reactionsEnabled'),
      event: json.parse('event', UpdateCommunityFeedPostRequestEvent.fromJson),
      audienceSubscriptionPlans: json.parseList('audienceSubscriptionPlans'),
      mediaItems: json.parseList('mediaItems'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'isPostedAsTenant': isPostedAsTenant,
      'audience': audience,
      'saveForLater': saveForLater,
      'commentsEnabled': commentsEnabled,
      'reactionsEnabled': reactionsEnabled,
      'event': event,
      'audienceSubscriptionPlans': audienceSubscriptionPlans,
      'mediaItems': mediaItems,
    };
  }
}
