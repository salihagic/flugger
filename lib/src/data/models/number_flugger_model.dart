import 'package:flugger/flugger.dart';

class NumberFluggerModel extends FluggerModel {
  final double? minimum;
  final double? maximum;
  final bool exclusiveMinimum;
  final bool exclusiveMaximum;

  NumberFluggerModel({
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

  factory NumberFluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    return NumberFluggerModel(
      originalDataType: originalDataType,
      propertyName: propertyName,
      dataType: FluggerDataType.DOUBLE,
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
      }.toString();

  @override
  String generateParseMethod() => generateParseMethodWithPropertyName(generatePropertyName());

  @override
  String generateParseMethodWithPropertyName(String propertyName) => 'parseDouble(\'$propertyName\')';
}
