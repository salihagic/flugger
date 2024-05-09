import 'package:flugger/flugger.dart';

class EnumFluggerModel extends FluggerModel {
  EnumFluggerModel({
    required super.originalDataType,
    super.propertyName,
    required super.dataType,
    required super.modelType,
    super.nullable,
    super.root,
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
    );
  }

  @override
  String generatePropertyType() => transformedOriginalDataType;
}
