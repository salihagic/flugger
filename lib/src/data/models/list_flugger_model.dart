import 'package:flugger/flugger.dart';

class ListFluggerModel extends FluggerModel {
  FluggerModel? templateDataType;

  ListFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
    this.templateDataType,
  });

  factory ListFluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    return ListFluggerModel(
      originalDataType: originalDataType,
      propertyName: propertyName,
      dataType: FluggerDataType.LIST,
      modelType: FluggerModelType.BASIC,
      nullable: json['nullable'] ?? false,
      root: root,
      templateDataType: FluggerModel.fromJson(
        originalDataType,
        json['items'],
        options,
      ),
    );
  }

  @override
  String toString() => {
    'originalDataType': originalDataType,
    'dataType': dataType.value,
    'nullable': nullable,
    'root': root,
    'templateDataType': templateDataType.toString(),
  }.toString();

  @override
  String generatePropertyType() => 'List<${generateTemplateDataType()}>';

  String generateTemplateDataType() =>
      templateDataType?.generatePropertyType() ?? 'UNKNOWN_TEMPLATE_DATA_TYPE';

  @override
  String generateParseMethod() =>
      generateParseMethodWithPropertyName(generatePropertyName());

  @override
  String generateParseMethodWithPropertyName(String propertyName) =>
      'parseList(\'$propertyName\'${templateDataType is ReferenceFluggerModel ? ', ${templateDataType?.generatePropertyType()}.fromJson' : ''})';
}
