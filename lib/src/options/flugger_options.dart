// ignore_for_file: non_constant_identifier_names

import 'package:flugger/flugger.dart';
import 'package:yaml/yaml.dart';

class FluggerOptions {
  final StructureFluggerOptions structure;
  final String destination_path_prefix;
  final List<String> generic_imports;
  final ModelFluggerOptions request;
  final ModelFluggerOptions response;
  final ModelFluggerOptions search;
  final SwaggerFluggerOptions? swagger;

  FluggerOptions({
    required this.structure,
    required this.destination_path_prefix,
    required this.generic_imports,
    required this.request,
    required this.response,
    required this.search,
    required this.swagger,
  });

  factory FluggerOptions.fromYamlMap(YamlMap map) {
    return FluggerOptions(
      structure: map['structure'] != null ? StructureFluggerOptions.fromYamlMap(map['structure']) : StructureFluggerOptions.initial(),
      destination_path_prefix: map['destination_path_prefix'] ?? '',
      generic_imports: map['generic_imports']?.map<String>((x) => x as String).toList(),
      request: map['request'] != null ? ModelFluggerOptions.fromYamlMap(map['request']) : ModelFluggerOptions.initial(),
      response: map['response'] != null ? ModelFluggerOptions.fromYamlMap(map['response']) : ModelFluggerOptions.initial(),
      search: map['search'] != null ? ModelFluggerOptions.fromYamlMap(map['search']) : ModelFluggerOptions.initial(),
      swagger: map['swagger'] != null ? SwaggerFluggerOptions.fromYamlMap(map['swagger']) : null,
    );
  }
}
