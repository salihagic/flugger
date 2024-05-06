import 'package:onedigital_customer/_all.dart';

class RescheduleCommunityFeedPostRequestModel {
  final String scheduledOnUtc;

  RescheduleCommunityFeedPostRequestModel({
    required this.scheduledOnUtc,
  });

  factory RescheduleCommunityFeedPostRequestModel.fromMap(Map<String, dynamic> map) {
    return RescheduleCommunityFeedPostRequestModel(
      scheduledOnUtc: map.parseValue('scheduledOnUtc'),
    );
  }
}
