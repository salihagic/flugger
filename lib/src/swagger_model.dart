// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_field, constant_identifier_names

import 'package:flugger/flugger.dart';

class SwaggerModel {
  final String? openapi;
  final List<SwaggerSchemaModel> schemas;

  SwaggerModel({
    this.openapi,
    required this.schemas,
  });

  factory SwaggerModel.fromJson(Map<String, dynamic> map, SwaggerGeneratorOptions options) {
    return SwaggerModel(
      openapi: map['openapi'],
      schemas: map['components']['schemas'].entries.map<SwaggerSchemaModel>((entry) => SwaggerSchemaModel.fromJson(entry.key, entry.value)).toList(),
    );
  }
}

class SwaggerSchemaModel {
  final String name;
  final List<String> nameTree;
  final String type;
  final bool nullable;
  final List<SwaggerSchemaModel>? properties;

  SwaggerSchemaModel({
    required this.name,
    required this.nameTree,
    required this.type,
    required this.nullable,
    this.properties,
  });

  factory SwaggerSchemaModel.fromJson(String name, Map<String, dynamic> map) {
    final type = parseType(map);
    final nameTree = name.split('.');

    return SwaggerSchemaModel(
      name: nameTree.last,
      nameTree: nameTree,
      type: type,
      nullable: map['nullable'] ?? false,
      properties: map['properties']?.entries.map<SwaggerSchemaModel>((entry) => SwaggerSchemaModel.fromJson(entry.key, entry.value)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'nameTree': nameTree,
      'type': type,
      'nullable': nullable,
      'properties': properties?.map((x) => x.toJson()).toList(),
    };
  }

  SwaggerSchemaModel copyWith({
    String? name,
    List<String>? nameTree,
    String? type,
    bool? nullable,
    List<SwaggerSchemaModel>? properties,
  }) {
    return SwaggerSchemaModel(
      name: name ?? this.name,
      nameTree: nameTree ?? this.nameTree,
      type: type ?? this.type,
      nullable: nullable ?? this.nullable,
      properties: properties ?? this.properties,
    );
  }
}

String parseType(Map<String, dynamic> map) => switch (map['type']?.toLowerCase()) {
      'string' => 'string',
      'int' => 'int',
      'double' => 'double',
      'boolean' => 'boolean',
      'list' => 'list',
      'object' => 'object',
      _ => map['\$ref'].replaceAll('#/components/schemas/', '').split('.').last,
    };
