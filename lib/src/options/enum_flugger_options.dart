// ignore_for_file: non_constant_identifier_names

import 'package:yaml/yaml.dart';

/// Model Flugger options that get populated from values from flugger.yaml file from parent project
class EnumFluggerOptions {
  /// Name sufix for the model of specific type, could be anything based on the desired naming convention (eg. ResponseModel, SearchModel, RequestModel, Model ...)
  final String name_sufix;

  /// Specify a string that should be removed from the input model's name (eg. swagger specifies a model with name AccountApplicationModel, name_part_to_remove='ApplicationModel' => result Account(+ name_sufix if any specified))
  final String name_part_to_remove;

  /// If the convention is structured, all folders of the same type will be grouped into group parent folder (eg. response_models)
  final String parent_folder_name;

  /// Specify if the model of this specific type should have generated parse method in the resulting file
  final bool parse;

  EnumFluggerOptions({
    required this.name_sufix,
    required this.name_part_to_remove,
    required this.parent_folder_name,
    required this.parse,
  });

  /// Default values for Enum options
  factory EnumFluggerOptions.initial() => EnumFluggerOptions(
        name_sufix: '',
        name_part_to_remove: '',
        parent_folder_name: 'enums',
        parse: true,
      );

  /// Parsing method used by this tool to parse the values from flugger.yaml file to strongly typed ModelFluggerOptions
  @override
  factory EnumFluggerOptions.fromYamlMap(YamlMap map) {
    return EnumFluggerOptions(
      name_sufix: map['name_sufix'] ?? '',
      name_part_to_remove: map['name_part_to_remove'] ?? '',
      parent_folder_name: map['parent_folder_name'] ?? '',
      parse: map['parse'] ?? '',
    );
  }
}
