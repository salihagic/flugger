import 'package:onedigital_customer/_all.dart';

class UpdateCommunityFeedPostEventRequestModel {
  final String? title;
  final String? coverImageUrl;
  final int type;
  final String? eventUrl;
  final String? address;
  final int format;
  final String startDate;
  final String? startTime;
  final String endDate;
  final String? endTime;

  UpdateCommunityFeedPostEventRequestModel({
    this.title,
    this.coverImageUrl,
    required this.type,
    this.eventUrl,
    this.address,
    required this.format,
    required this.startDate,
    this.startTime,
    required this.endDate,
    this.endTime,
  });

  factory UpdateCommunityFeedPostEventRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateCommunityFeedPostEventRequestModel(
      title: map.parseValue('title'),
      coverImageUrl: map.parseValue('coverImageUrl'),
      type: map.parseValue('type'),
      eventUrl: map.parseValue('eventUrl'),
      address: map.parseValue('address'),
      format: map.parseValue('format'),
      startDate: map.parseValue('startDate'),
      startTime: map.parseValue('startTime'),
      endDate: map.parseValue('endDate'),
      endTime: map.parseValue('endTime'),
    );
  }
}
