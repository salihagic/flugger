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

  factory ReactCommunityFeedPostCommentReactionRequestModel.fromMap(Map<String, dynamic> map) {
    return ReactCommunityFeedPostCommentReactionRequestModel(
      communityFeedPostId: map.parseValue('communityFeedPostId'),
      commentId: map.parseValue('commentId'),
      emoji: map.parseValue('emoji'),
    );
  }
}
