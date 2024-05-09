import 'package:onedigital_customer/_all.dart';

class RescheduleCommunityFeedPostRequestModel {
  final String scheduledOnUtc;

  RescheduleCommunityFeedPostRequestModel({
    required this.scheduledOnUtc,
  });

  RescheduleCommunityFeedPostRequestModel copyWith({
    String? scheduledOnUtc,
  }) {
    return RescheduleCommunityFeedPostRequestModel(
      scheduledOnUtc: scheduledOnUtc ?? this.scheduledOnUtc,
    );
  }

  factory RescheduleCommunityFeedPostRequestModel.fromJson(Map<String, dynamic> json) {
    return RescheduleCommunityFeedPostRequestModel(
      scheduledOnUtc: json.parseValue('scheduledOnUtc'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'scheduledOnUtc': scheduledOnUtc,
    };
  }
}
