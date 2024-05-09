import 'package:onedigital_customer/_all.dart';

class CreateCommunityFeedPostEventRequestModel {
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

  CreateCommunityFeedPostEventRequestModel({
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

  CreateCommunityFeedPostEventRequestModel copyWith({
    String? title,
    String? coverImageUrl,
    int? type,
    String? eventUrl,
    String? address,
    int? format,
    String? startDate,
    String? startTime,
    String? endDate,
    String? endTime,
  }) {
    return CreateCommunityFeedPostEventRequestModel(
      title: title ?? this.title,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      type: type ?? this.type,
      eventUrl: eventUrl ?? this.eventUrl,
      address: address ?? this.address,
      format: format ?? this.format,
      startDate: startDate ?? this.startDate,
      startTime: startTime ?? this.startTime,
      endDate: endDate ?? this.endDate,
      endTime: endTime ?? this.endTime,
    );
  }

  factory CreateCommunityFeedPostEventRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateCommunityFeedPostEventRequestModel(
      title: json.parseValue('title'),
      coverImageUrl: json.parseValue('coverImageUrl'),
      type: json.parseValue('type'),
      eventUrl: json.parseValue('eventUrl'),
      address: json.parseValue('address'),
      format: json.parseValue('format'),
      startDate: json.parseValue('startDate'),
      startTime: json.parseValue('startTime'),
      endDate: json.parseValue('endDate'),
      endTime: json.parseValue('endTime'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'coverImageUrl': coverImageUrl,
      'type': type,
      'eventUrl': eventUrl,
      'address': address,
      'format': format,
      'startDate': startDate,
      'startTime': startTime,
      'endDate': endDate,
      'endTime': endTime,
    };
  }
}
