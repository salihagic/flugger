import 'package:flugger/flugger.dart';

class DateTimeFluggerModel extends FluggerModel {
  DateTimeFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
  });

  factory DateTimeFluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    return DateTimeFluggerModel(
      originalDataType: originalDataType,
      propertyName: propertyName,
      dataType: FluggerDataType.DATETIME,
      modelType: FluggerModelType.BASIC,
      nullable: json['nullable'] ?? false,
      root: root,
    );
  }

  @override
  String generateParseMethod() =>
      generateParseMethodWithPropertyName(generatePropertyName());

  @override
  String generateParseMethodWithPropertyName(String propertyName) =>
      'parseDate(\'$propertyName\')';
}
