import 'package:onedigital_customer/_all.dart';

class ReactCommunityFeedPostRequestModel {
  final String? emoji;

  ReactCommunityFeedPostRequestModel({
    this.emoji,
  });

  factory ReactCommunityFeedPostRequestModel.fromMap(Map<String, dynamic> map) {
    return ReactCommunityFeedPostRequestModel(
      emoji: map.parseValue('emoji'),
    );
  }
}
