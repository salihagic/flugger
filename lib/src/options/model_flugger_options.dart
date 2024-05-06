// ignore_for_file: non_constant_identifier_names

import 'package:yaml/yaml.dart';

class ModelFluggerOptions {
  final String name_sufix;
  final String name_part_to_remove;
  final String parent_folder_name;
  final bool copyWith;
  final bool fromJson;
  final bool toJson;

  ModelFluggerOptions({
    required this.name_sufix,
    required this.name_part_to_remove,
    required this.parent_folder_name,
    required this.copyWith,
    required this.fromJson,
    required this.toJson,
  });

  factory ModelFluggerOptions.initialRequest() => ModelFluggerOptions(
        name_sufix: 'RequestModel',
        name_part_to_remove: 'Request',
        parent_folder_name: 'request_models',
        copyWith: true,
        fromJson: false,
        toJson: true,
      );

  factory ModelFluggerOptions.initialResponse() => ModelFluggerOptions(
        name_sufix: 'ResponseModel',
        name_part_to_remove: 'Response',
        parent_folder_name: 'response_models',
        copyWith: false,
        fromJson: true,
        toJson: false,
      );

  factory ModelFluggerOptions.initialSearch() => ModelFluggerOptions(
        name_sufix: 'SearchModel',
        name_part_to_remove: 'Search',
        parent_folder_name: 'search_models',
        copyWith: true,
        fromJson: false,
        toJson: true,
      );

  factory ModelFluggerOptions.initialModel() => ModelFluggerOptions(
        name_sufix: 'Model',
        name_part_to_remove: 'Model',
        parent_folder_name: 'models',
        copyWith: true,
        fromJson: true,
        toJson: true,
      );

  @override
  factory ModelFluggerOptions.fromYamlMap(YamlMap map) {
    return ModelFluggerOptions(
      name_sufix: map['name_sufix'] ?? '',
      name_part_to_remove: map['name_part_to_remove'] ?? '',
      parent_folder_name: map['parent_folder_name'] ?? '',
      copyWith: map['copyWith'] ?? '',
      fromJson: map['fromJson'] ?? '',
      toJson: map['toJson'] ?? '',
    );
  }
}
