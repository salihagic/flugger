// ignore_for_file: non_constant_identifier_names

import 'package:flugger/flugger.dart';
import 'package:yaml/yaml.dart';

/// Flugger options that get populated from values from flugger.yaml file from parent project
class FluggerOptions {
  /// Defines structure of the output files/folders
  final FluggerStructureType structure;

  /// Specifies relative path to destination of generated files/folders
  final String models_output_path;

  /// Specifies relative path to destination of generated files/folders
  final String enums_output_path;

  /// Specifies relative path to destination of generated extensions file that are used by models generated by this tool
  final String extensions_output_path;

  /// Specifies a list of generic imports that will be generated at the top of every generated file by this tool
  final List<String> generic_imports;

  /// Specifies a list of API model/enum names that should be ignored when generating dart models/enums
  final List<String> models_to_ignore;

  /// Options for model of type Request (usually have name sufix RequestModel and generate copyWith and toJson methods)
  final ModelFluggerOptions request;

  /// Options for model of type Response (usually have name sufix ResponseModel and generate fromJson method)
  final ModelFluggerOptions response;

  /// Options for model of type Search (usually have name sufix SearchModel and generate copyWith and toJson methods)
  final ModelFluggerOptions search;

  /// Options for model of type basic Model (usually have name sufix Model and generate copyWith, fromJson and toJson methods)
  final ModelFluggerOptions model;

  /// Options for model of type basic Model (usually have name sufix Model and generate copyWith, fromJson and toJson methods)
  final EnumFluggerOptions enums;

  /// URL as the source for swagger.json schema
  final String? url;

  /// Log information as the content gets generated
  final bool logging;

  FluggerOptions({
    required this.structure,
    required this.models_output_path,
    required this.enums_output_path,
    required this.extensions_output_path,
    required this.generic_imports,
    required this.models_to_ignore,
    required this.request,
    required this.response,
    required this.search,
    required this.model,
    required this.enums,
    required this.url,
    required this.logging,
  });

  /// Parsing method used by this tool to parse the values from flugger.yaml file to strongly typed FluggerOptions
  factory FluggerOptions.fromYamlMap(YamlMap map) {
    return FluggerOptions(
      structure: map['structure'] != null
          ? FluggerStructureType.parse(map['structure'])
          : FluggerStructureType.structured,
      models_output_path: map['models_output_path'] ?? '',
      enums_output_path: map['enums_output_path'] ?? '',
      extensions_output_path: map['extensions_output_path'] ?? '',
      generic_imports:
          map['generic_imports']?.map<String>((x) => x as String).toList() ??
              [],
      models_to_ignore:
          map['models_to_ignore']?.map<String>((x) => x as String).toList() ??
              [],
      request: map['request'] != null
          ? ModelFluggerOptions.fromYamlMap(map['request'])
          : ModelFluggerOptions.initialRequest(),
      response: map['response'] != null
          ? ModelFluggerOptions.fromYamlMap(map['response'])
          : ModelFluggerOptions.initialResponse(),
      search: map['search'] != null
          ? ModelFluggerOptions.fromYamlMap(map['search'])
          : ModelFluggerOptions.initialSearch(),
      model: map['model'] != null
          ? ModelFluggerOptions.fromYamlMap(map['model'])
          : ModelFluggerOptions.initialModel(),
      enums: map['enum'] != null
          ? EnumFluggerOptions.fromYamlMap(map['enums'])
          : EnumFluggerOptions.initial(),
      url: map['url'] as String?,
      logging: map['logging'] ?? false,
    );
  }
}
