import 'package:onedigital_customer/_all.dart';

class UpdateCommunityFeedPostMediaItemRequestModel {
  final String? id;
  final String? title;
  final String? fileName;
  final String? fileUri;
  final int fileSize;
  final int mediaType;

  UpdateCommunityFeedPostMediaItemRequestModel({
    this.id,
    this.title,
    this.fileName,
    this.fileUri,
    required this.fileSize,
    required this.mediaType,
  });

  factory UpdateCommunityFeedPostMediaItemRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateCommunityFeedPostMediaItemRequestModel(
      id: map.parseValue('id'),
      title: map.parseValue('title'),
      fileName: map.parseValue('fileName'),
      fileUri: map.parseValue('fileUri'),
      fileSize: map.parseValue('fileSize'),
      mediaType: map.parseValue('mediaType'),
    );
  }
}
