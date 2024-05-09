import 'package:onedigital_customer/_all.dart';

class UpdateTenantCustomerCommunityFeedPostCommentRequestModel {
  final String? content;

  UpdateTenantCustomerCommunityFeedPostCommentRequestModel({
    this.content,
  });

  UpdateTenantCustomerCommunityFeedPostCommentRequestModel copyWith({
    String? content,
  }) {
    return UpdateTenantCustomerCommunityFeedPostCommentRequestModel(
      content: content ?? this.content,
    );
  }

  factory UpdateTenantCustomerCommunityFeedPostCommentRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateTenantCustomerCommunityFeedPostCommentRequestModel(
      content: json.parseValue('content'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'content': content,
    };
  }
}
