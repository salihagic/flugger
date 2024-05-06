import 'package:onedigital_customer/_all.dart';

class UpdateTenantCustomerCommunityFeedPostCommentRequestModel {
  final String? content;

  UpdateTenantCustomerCommunityFeedPostCommentRequestModel({
    this.content,
  });

  factory UpdateTenantCustomerCommunityFeedPostCommentRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateTenantCustomerCommunityFeedPostCommentRequestModel(
      content: map.parseValue('content'),
    );
  }
}
