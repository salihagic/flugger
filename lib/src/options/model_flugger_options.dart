// ignore_for_file: non_constant_identifier_names

import 'package:yaml/yaml.dart';

class ModelFluggerOptions {
  final String name_sufix;
  final String name_part_to_remove;
  final String parent_folder_name;

  ModelFluggerOptions({
    required this.name_sufix,
    required this.name_part_to_remove,
    required this.parent_folder_name,
  });

  factory ModelFluggerOptions.initial() => ModelFluggerOptions(
        name_sufix: '',
        name_part_to_remove: '',
        parent_folder_name: '',
      );

  @override
  factory ModelFluggerOptions.fromYamlMap(YamlMap map) {
    return ModelFluggerOptions(
      name_sufix: map['name_sufix'] ?? '',
      name_part_to_remove: map['name_part_to_remove'] ?? '',
      parent_folder_name: map['parent_folder_name'] ?? '',
    );
  }
}
