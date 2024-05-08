import 'package:flugger/flugger.dart';

class Model {
  final String name;
  final String originalName;
  final List<String> nameTree;
  final String fileName;
  final String? namespace;
  final FluggerDataType dataType;
  final String? dataTypeObjectType;
  final FluggerDataType? templateDataType;
  final String? templateDataTypeObjectType;
  final FluggerModelType modelType;
  final bool nullable;
  final List<Model> properties;

  String get type => switch (dataType) {
        FluggerDataType.OBJECT => dataTypeObjectType ?? 'Object',
        FluggerDataType.LIST =>
          'List<${templateDataTypeObjectType ?? templateDataType?.value ?? 'Object'}>',
        FluggerDataType.ENUM => dataTypeObjectType ?? 'ENUM',
        _ => dataType.value,
      };

  Model({
    required this.name,
    required this.originalName,
    required this.nameTree,
    required this.fileName,
    this.namespace,
    required this.dataType,
    this.dataTypeObjectType,
    this.templateDataType,
    this.templateDataTypeObjectType,
    required this.modelType,
    required this.nullable,
    required this.properties,
  });

  factory Model.fromJson(
    String name,
    Map<String, dynamic> map,
    FluggerOptions options, [
    bool isRootModel = true,
    FluggerModelType? pModelType,
  ]) {
    final dataType = FluggerDataType.parse(map);
    final dataTypeObjectName =
        map['\$ref']?.replaceAll('#/components/schemas/', '')?.split('.')?.last;

    final templateDataType =
        dataType == FluggerDataType.LIST && map['items']?['type'] != null
            ? FluggerDataType.parse(map['items']?['type'])
            : null;
    final templateDataTypeObjectType =
        dataType == FluggerDataType.LIST && map['items']?['\$ref'] != null
            ? map['items']['\$ref']
                .replaceAll('#/components/schemas/', '')
                ?.split('.')
                ?.last
            : null;

    final modelType = pModelType ?? FluggerModelType.parse(name, options);
    final transformedDataTypeObjectType = dataType == FluggerDataType.OBJECT
        ? _transformName(dataTypeObjectName ?? 'Object', modelType, options)
        : dataType == FluggerDataType.ENUM
            ? dataTypeObjectName
            : null;

    final templateModelType = templateDataTypeObjectType != null
        ? FluggerModelType.parse(templateDataTypeObjectType, options)
        : modelType;
    final transformedTemplateDataTypeObjectType = templateDataTypeObjectType !=
            null
        ? _transformName(
            templateDataTypeObjectType ?? 'Object', templateModelType, options)
        : null;

    final nameTree = name.split('.');
    final transformedName = isRootModel
        ? _transformName(nameTree.last, modelType, options)
        : nameTree.last;

    final namespace =
        _toSnakeCase(nameTree.length >= 2 ? nameTree[nameTree.length - 2] : '');
    final fileName = '${_toSnakeCase(transformedName)}.dart';

    return Model(
      name: transformedName,
      originalName: nameTree.last,
      nameTree: nameTree,
      fileName: fileName,
      namespace: namespace,
      dataType: dataType,
      dataTypeObjectType: transformedDataTypeObjectType,
      templateDataType: templateDataType,
      templateDataTypeObjectType: transformedTemplateDataTypeObjectType,
      modelType: modelType,
      nullable: map['nullable'] ?? false,
      properties: map['properties']
              ?.entries
              .map<Model>(
                (entry) => Model.fromJson(
                  entry.key,
                  entry.value,
                  options,
                  false,
                  modelType,
                ),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'nameTree': nameTree,
      'dataType': dataType.value,
      'fileName': fileName,
      'namespace': namespace,
      'modelType': modelType.value,
      'nullable': nullable,
      'properties': properties.map((x) => x.toJson()).toList(),
    };
  }

  static String _transformName(
    String name,
    FluggerModelType modelType,
    FluggerOptions options,
  ) {
    return switch (modelType) {
      FluggerModelType.REQUEST =>
        name.replaceAll(options.request.name_part_to_remove, '') +
            options.request.name_sufix,
      FluggerModelType.RESPONSE =>
        name.replaceAll(options.response.name_part_to_remove, '') +
            options.response.name_sufix,
      FluggerModelType.SEARCH =>
        name.replaceAll(options.search.name_part_to_remove, '') +
            options.search.name_sufix,
      FluggerModelType.MODEL =>
        name.replaceAll(options.model.name_part_to_remove, '') +
            options.model.name_sufix,
    };
  }

  static String _toSnakeCase(String name) {
    final result = name.replaceAllMapped(
        RegExp(r'[A-Z]'), (Match m) => '_${m[0]!.toLowerCase()}');

    return result.startsWith('_')
        ? result.substring(1)
        : result.endsWith('_')
            ? result.substring(0, result.length - 2)
            : result;
  }
}
