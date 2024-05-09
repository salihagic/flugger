// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flugger/flugger.dart';

class ReferenceFluggerModel extends FluggerModel {
  @override
  String get id => referenceOriginalName;

  final String referenceOriginalName;
  FluggerModel? reference;

  ReferenceFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
    required this.referenceOriginalName,
    this.reference,
  });

  factory ReferenceFluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    return ReferenceFluggerModel(
      originalDataType: originalDataType,
      propertyName: propertyName,
      dataType: FluggerDataType.REFERENCE,
      modelType: FluggerModelType.parse(originalDataType, options),
      nullable: json['nullable'] ?? false,
      root: root,
      referenceOriginalName: json['\$ref'].replaceAll('#/components/schemas/', ''),
    );
  }

  @override
  String toString() => {
        'originalDataType': originalDataType,
        'dataType': dataType.value,
        'nullable': nullable,
        'root': root,
        'referenceOriginalName': referenceOriginalName,
        'reference': reference,
      }.toString();

  ReferenceFluggerModel copyWith({
    FluggerModel? reference,
  }) {
    return ReferenceFluggerModel(
      originalDataType: originalDataType,
      dataType: dataType,
      modelType: modelType,
      nullable: nullable,
      root: root,
      referenceOriginalName: referenceOriginalName,
      reference: reference ?? this.reference,
    );
  }

  @override
  String generatePropertyType() => transformedReferenceOriginalName;

  List<String> get referenceOriginalDataTypeTree => referenceOriginalName.split('.');
  String get transformedReferenceOriginalName {
    if (root) {
      return switch (modelType) {
        FluggerModelType.REQUEST => referenceOriginalDataTypeTree.last.replaceAll(options.request.name_part_to_remove, '') + options.request.name_sufix,
        FluggerModelType.RESPONSE => referenceOriginalDataTypeTree.last.replaceAll(options.response.name_part_to_remove, '') + options.response.name_sufix,
        FluggerModelType.SEARCH => referenceOriginalDataTypeTree.last.replaceAll(options.search.name_part_to_remove, '') + options.search.name_sufix,
        FluggerModelType.MODEL => referenceOriginalDataTypeTree.last.replaceAll(options.model.name_part_to_remove, '') + options.model.name_sufix,
        FluggerModelType.ENUM => referenceOriginalDataTypeTree.last.replaceAll(options.enums.name_part_to_remove, '') + options.enums.name_sufix,
        FluggerModelType.BASIC => referenceOriginalDataTypeTree.last,
      };
    }

    return referenceOriginalDataTypeTree.last;
  }

  @override
  String generateParseMethod() => reference?.generateParseMethod() ?? '<UNABLE TO GENERATE PARSE METHOD>';
}
