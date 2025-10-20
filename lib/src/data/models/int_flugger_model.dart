import 'package:flugger/flugger.dart';

class IntFluggerModel extends FluggerModel {
  final int? minimum;
  final int? maximum;
  final bool exclusiveMinimum;
  final bool exclusiveMaximum;

  IntFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
    this.minimum,
    this.maximum,
    required this.exclusiveMinimum,
    required this.exclusiveMaximum,
  });

  factory IntFluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    return IntFluggerModel(
      originalDataType: originalDataType,
      propertyName: propertyName,
      dataType: FluggerDataType.INT,
      modelType: FluggerModelType.BASIC,
      nullable: json['nullable'] ?? false,
      root: root,
      minimum: json['minimum'],
      maximum: json['maximum'],
      exclusiveMinimum: json['exclusiveMinimum'] ?? false,
      exclusiveMaximum: json['exclusiveMaximum'] ?? false,
    );
  }

  @override
  String toString() => {
    'originalDataType': originalDataType,
    'dataType': dataType.value,
    'nullable': nullable,
    'root': root,
    'minimum': minimum,
    'maximum': maximum,
    'exclusiveMinimum': exclusiveMinimum,
    'exclusiveMaximum': exclusiveMaximum,
  }.toString();
}
