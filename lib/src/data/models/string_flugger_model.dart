import 'package:flugger/flugger.dart';

class StringFluggerModel extends FluggerModel {
  final int? minLength;
  final int? maxLength;

  StringFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
    this.minLength,
    this.maxLength,
  });

  factory StringFluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    return StringFluggerModel(
      originalDataType: originalDataType,
      propertyName: propertyName,
      dataType: FluggerDataType.STRING,
      modelType: FluggerModelType.BASIC,
      nullable: json['nullable'] ?? false,
      root: root,
      minLength: json['minLength'],
      maxLength: json['maxLength'],
    );
  }

  @override
  String toString() => {
        'originalDataType': originalDataType,
        'dataType': dataType.value,
        'nullable': nullable,
        'root': root,
      }.toString();
}
