import 'package:onedigital_customer/_all.dart';

class ReactCommunityFeedPostRequestModel {
  final String? emoji;

  ReactCommunityFeedPostRequestModel({
    this.emoji,
  });

  ReactCommunityFeedPostRequestModel copyWith({
    String? emoji,
  }) {
    return ReactCommunityFeedPostRequestModel(
      emoji: emoji ?? this.emoji,
    );
  }

  factory ReactCommunityFeedPostRequestModel.fromJson(Map<String, dynamic> json) {
    return ReactCommunityFeedPostRequestModel(
      emoji: json.parseValue('emoji'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'emoji': emoji,
    };
  }
}
