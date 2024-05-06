import 'package:onedigital_customer/_all.dart';

class CreateCommunityFeedPostCommentRequestModel {
  final String? communityFeedPostCommentId;
  final String? content;

  CreateCommunityFeedPostCommentRequestModel({
    this.communityFeedPostCommentId,
    this.content,
  });

  factory CreateCommunityFeedPostCommentRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateCommunityFeedPostCommentRequestModel(
      communityFeedPostCommentId: map.parseValue('communityFeedPostCommentId'),
      content: map.parseValue('content'),
    );
  }
}
