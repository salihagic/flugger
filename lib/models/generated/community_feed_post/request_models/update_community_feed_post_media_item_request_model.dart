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

  UpdateCommunityFeedPostMediaItemRequestModel copyWith({
    String? id,
    String? title,
    String? fileName,
    String? fileUri,
    int? fileSize,
    int? mediaType,
  }) {
    return UpdateCommunityFeedPostMediaItemRequestModel(
      id: id ?? this.id,
      title: title ?? this.title,
      fileName: fileName ?? this.fileName,
      fileUri: fileUri ?? this.fileUri,
      fileSize: fileSize ?? this.fileSize,
      mediaType: mediaType ?? this.mediaType,
    );
  }

  factory UpdateCommunityFeedPostMediaItemRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateCommunityFeedPostMediaItemRequestModel(
      id: json.parseValue('id'),
      title: json.parseValue('title'),
      fileName: json.parseValue('fileName'),
      fileUri: json.parseValue('fileUri'),
      fileSize: json.parseValue('fileSize'),
      mediaType: json.parseValue('mediaType'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'fileName': fileName,
      'fileUri': fileUri,
      'fileSize': fileSize,
      'mediaType': mediaType,
    };
  }
}
