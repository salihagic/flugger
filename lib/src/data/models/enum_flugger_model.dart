import 'package:flugger/flugger.dart';

class EnumFluggerModel extends FluggerModel {
  final FluggerDataType enumDataType;
  final List<dynamic> values;

  EnumFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
    required this.enumDataType,
    required this.values,
  });

  factory EnumFluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    return EnumFluggerModel(
      originalDataType: originalDataType,
      propertyName: propertyName,
      dataType: FluggerDataType.ENUM,
      modelType: FluggerModelType.ENUM,
      nullable: json['nullable'] ?? false,
      root: root,
      enumDataType: FluggerDataType.parse(json),
      values: json['enum'].map((x) => x).toList(),
    );
  }

  String generateEnumName() => transformedOriginalDataType;

  String generateEnumDataType() => enumDataType.value;

  @override
  String generatePropertyType() => transformedOriginalDataType;

  @override
  String generateParseMethod() => 'parseEnum(\'${generatePropertyName()}\', ${generatePropertyType()}.parse)';
}
