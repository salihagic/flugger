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

  factory CreateCommunityFeedPostMediaItemRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateCommunityFeedPostMediaItemRequestModel(
      title: map.parseValue('title'),
      fileName: map.parseValue('fileName'),
      fileUri: map.parseValue('fileUri'),
      fileSize: map.parseValue('fileSize'),
      mediaType: map.parseValue('mediaType'),
    );
  }
}
