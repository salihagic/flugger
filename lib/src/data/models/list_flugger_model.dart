import 'package:flugger/flugger.dart';

class ListFluggerModel extends FluggerModel {
  final FluggerModel templateDataType;

  ListFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
    required this.templateDataType,
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
      templateDataType: FluggerModel.fromJson(originalDataType, json['items'], options),
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
}
