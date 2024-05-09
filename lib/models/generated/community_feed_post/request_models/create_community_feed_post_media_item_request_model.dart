import 'package:onedigital_customer/_all.dart';

class CreateCommunityFeedPostMediaItemRequestModel {
  final String? title;
  final String? fileName;
  final String? fileUri;
  final int fileSize;
  final int mediaType;

  CreateCommunityFeedPostMediaItemRequestModel({
    this.title,
    this.fileName,
    this.fileUri,
    required this.fileSize,
    required this.mediaType,
  });

  CreateCommunityFeedPostMediaItemRequestModel copyWith({
    String? title,
    String? fileName,
    String? fileUri,
    int? fileSize,
    int? mediaType,
  }) {
    return CreateCommunityFeedPostMediaItemRequestModel(
      title: title ?? this.title,
      fileName: fileName ?? this.fileName,
      fileUri: fileUri ?? this.fileUri,
      fileSize: fileSize ?? this.fileSize,
      mediaType: mediaType ?? this.mediaType,
    );
  }

  factory CreateCommunityFeedPostMediaItemRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateCommunityFeedPostMediaItemRequestModel(
      title: json.parseValue('title'),
      fileName: json.parseValue('fileName'),
      fileUri: json.parseValue('fileUri'),
      fileSize: json.parseValue('fileSize'),
      mediaType: json.parseValue('mediaType'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'fileName': fileName,
      'fileUri': fileUri,
      'fileSize': fileSize,
      'mediaType': mediaType,
    };
  }
}
