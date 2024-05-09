import 'package:flugger/flugger.dart';

class BoolFluggerModel extends FluggerModel {
  BoolFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
  });

  factory BoolFluggerModel.fromJson(
    String originalDataType,
    Map<String, dynamic> json,
    FluggerOptions options, [
    bool root = false,
    String? propertyName,
  ]) {
    return BoolFluggerModel(
      originalDataType: originalDataType,
      propertyName: propertyName,
      dataType: FluggerDataType.BOOL,
      modelType: FluggerModelType.BASIC,
      nullable: json['nullable'] ?? false,
      root: root,
    );
  }
}
