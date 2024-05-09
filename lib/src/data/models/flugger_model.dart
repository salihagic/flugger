import 'package:flugger/flugger.dart';

abstract class FluggerModel {
  final String originalDataType;
  final String? propertyName;
  final FluggerDataType dataType;
  final FluggerModelType modelType;
  final bool nullable;
  final bool root;

  FluggerModel({
    required this.originalDataType,
    this.propertyName,
    required this.dataType,
    required this.modelType,
    this.nullable = false,
    this.root = false,
  });

  factory FluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    if (json['\$ref'] != null) {
      return ReferenceFluggerModel.fromJson(originalDataType, json, options, root, propertyName);
    }

    return switch (json['type']) {
      'string' => StringFluggerModel.fromJson(originalDataType, json, options, root, propertyName),
      'number' => NumberFluggerModel.fromJson(originalDataType, json, options, root, propertyName),
      'integer' => () {
          if (json['enum'] != null) {
            return EnumFluggerModel.fromJson(originalDataType, json, options, root, propertyName);
          }

          return IntFluggerModel.fromJson(originalDataType, json, options, root, propertyName);
        }(),
      'boolean' => BoolFluggerModel.fromJson(originalDataType, json, options, root, propertyName),
      'array' => ListFluggerModel.fromJson(originalDataType, json, options, root, propertyName),
      'object' => ObjectFluggerModel.fromJson(originalDataType, json, options, root, propertyName),
      _ => ObjectFluggerModel.fromJson(originalDataType, json, options, root, propertyName),
    };
  }

  @override
  String toString() => {
        'id': id,
        'originalDataType': originalDataType,
        'propertyName': propertyName,
        'dataType': dataType.value,
        'nullable': nullable,
        'root': root,
        'originalDataTypeTree': originalDataTypeTree,
        'namespace': namespace,
        'fileName': fileName,
        'transformedOriginalDataType': transformedOriginalDataType,
      }.toString();

  String get id => originalDataType;
  List<String> get originalDataTypeTree => originalDataType.split('.');
  String get namespace => (originalDataTypeTree.length >= 2 ? originalDataTypeTree[originalDataTypeTree.length - 2] : '').toSnakeCase();
  String get fileName => '${transformedOriginalDataType.toSnakeCase()}.dart';
  String get transformedOriginalDataType {
    if (root) {
      return switch (modelType) {
        FluggerModelType.REQUEST => originalDataTypeTree.last.replaceAll(options.request.name_part_to_remove, '') + options.request.name_sufix,
        FluggerModelType.RESPONSE => originalDataTypeTree.last.replaceAll(options.response.name_part_to_remove, '') + options.response.name_sufix,
        FluggerModelType.SEARCH => originalDataTypeTree.last.replaceAll(options.search.name_part_to_remove, '') + options.search.name_sufix,
        FluggerModelType.MODEL => originalDataTypeTree.last.replaceAll(options.model.name_part_to_remove, '') + options.model.name_sufix,
        FluggerModelType.ENUM => originalDataTypeTree.last.replaceAll(options.enums.name_part_to_remove, '') + options.enums.name_sufix,
        FluggerModelType.BASIC => originalDataType,
      };
    }

    return originalDataTypeTree.last;
  }

  String generatePropertyType() => switch (dataType) {
        FluggerDataType.STRING => dataType.value,
        FluggerDataType.DATETIME => dataType.value,
        FluggerDataType.INT => dataType.value,
        FluggerDataType.DOUBLE => dataType.value,
        FluggerDataType.BOOL => dataType.value,
        _ => 'UNKNOWN',
      };

  String generateNullableSign() => nullable ? '?' : '';
  String generatePropertyName() => propertyName ?? 'UNKNOWN';
  String generateRequired() => nullable ? '' : 'required ';
}
