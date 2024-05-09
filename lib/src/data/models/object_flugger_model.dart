import 'package:flugger/flugger.dart';

class ObjectFluggerModel extends FluggerModel {
  final List<FluggerModel> properties;

  ObjectFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
    required this.properties,
  });

  factory ObjectFluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    return ObjectFluggerModel(
      originalDataType: originalDataType,
      propertyName: propertyName,
      dataType: FluggerDataType.OBJECT,
      modelType: FluggerModelType.parse(originalDataType, options),
      nullable: json['nullable'] ?? false,
      root: root,
      properties: json['properties']?.entries.map<FluggerModel>(
            (entry) {
              return FluggerModel.fromJson(
                json['type'] ??
                    json['\$ref'].replaceAll('#/components/schemas/', ''),
                entry.value,
                options,
                false,
                entry.key,
              );
            },
          ).toList() ??
          [],
    );
  }

  @override
  String toString() => {
        'id': id,
        'originalDataType': originalDataType,
        'dataType': dataType.value,
        'nullable': nullable,
        'root': root,
        'properties': properties,
        // 'originalDataTypeTree': originalDataTypeTree,
        // 'namespace': namespace,
        // 'fileName': fileName,
        'transformedOriginalDataType': transformedOriginalDataType,
      }.toString();

  String generateClassName() => transformedOriginalDataType;

  @override
  String generatePropertyType() => transformedOriginalDataType;

  @override
  String generateParseMethod() =>
      generateParseMethodWithPropertyName(generatePropertyName());

  @override
  String generateParseMethodWithPropertyName(String propertyName) =>
      'parse(\'$propertyName\', ${generatePropertyType()}.fromJson)';
}
