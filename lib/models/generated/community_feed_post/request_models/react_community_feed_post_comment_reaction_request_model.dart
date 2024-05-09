import 'package:onedigital_customer/_all.dart';

class ReactCommunityFeedPostCommentReactionRequestModel {
  final String communityFeedPostId;
  final String commentId;
  final String? emoji;

  ReactCommunityFeedPostCommentReactionRequestModel({
    required this.communityFeedPostId,
    required this.commentId,
    this.emoji,
  });

  ReactCommunityFeedPostCommentReactionRequestModel copyWith({
    String? communityFeedPostId,
    String? commentId,
    String? emoji,
  }) {
    return ReactCommunityFeedPostCommentReactionRequestModel(
      communityFeedPostId: communityFeedPostId ?? this.communityFeedPostId,
      commentId: commentId ?? this.commentId,
      emoji: emoji ?? this.emoji,
    );
  }

  factory ReactCommunityFeedPostCommentReactionRequestModel.fromJson(Map<String, dynamic> json) {
    return ReactCommunityFeedPostCommentReactionRequestModel(
      communityFeedPostId: json.parseValue('communityFeedPostId'),
      commentId: json.parseValue('commentId'),
      emoji: json.parseValue('emoji'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'communityFeedPostId': communityFeedPostId,
      'commentId': commentId,
      'emoji': emoji,
    };
  }
}
