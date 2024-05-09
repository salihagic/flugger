import 'package:onedigital_customer/_all.dart';

class CreateCommunityFeedPostCommentRequestModel {
  final String? communityFeedPostCommentId;
  final String? content;

  CreateCommunityFeedPostCommentRequestModel({
    this.communityFeedPostCommentId,
    this.content,
  });

  CreateCommunityFeedPostCommentRequestModel copyWith({
    String? communityFeedPostCommentId,
    String? content,
  }) {
    return CreateCommunityFeedPostCommentRequestModel(
      communityFeedPostCommentId: communityFeedPostCommentId ?? this.communityFeedPostCommentId,
      content: content ?? this.content,
    );
  }

  factory CreateCommunityFeedPostCommentRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateCommunityFeedPostCommentRequestModel(
      communityFeedPostCommentId: json.parseValue('communityFeedPostCommentId'),
      content: json.parseValue('content'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'communityFeedPostCommentId': communityFeedPostCommentId,
      'content': content,
    };
  }
}
