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
      referenceOriginalName:
          json['\$ref'].replaceAll('#/components/schemas/', ''),
    );
  }

  @override
  String toString() => {
        'id': id,
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
  String generatePropertyType() =>
      reference?.generatePropertyType() ?? 'UNKNOWN_REFERENCE_TYPE';

  @override
  String generateParseMethod() =>
      reference?.generateParseMethodWithPropertyName(propertyName ?? '') ??
      '<UNABLE TO GENERATE PARSE METHOD>';
}
