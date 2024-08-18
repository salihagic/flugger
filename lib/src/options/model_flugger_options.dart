// ignore_for_file: non_constant_identifier_names

import 'package:yaml/yaml.dart';

/// Model Flugger options that get populated from values from flugger.yaml file from parent project
class ModelFluggerOptions {
  /// Name sufix for the model of specific type, could be anything based on the desired naming convention (eg. ResponseModel, SearchModel, RequestModel, Model ...)
  final String name_sufix;

  /// Specify a string that should be removed from the input model's name (eg. swagger specifies a model with name AccountApplicationModel, name_part_to_remove='ApplicationModel' => result Account(+ name_sufix if any specified))
  final String name_part_to_remove;

  /// If the convention is structured, all folders of the same type will be grouped into group parent folder (eg. response_models)
  final String parent_folder_name;

  /// Specify if the model of this specific type should have generated copyWith method in the resulting file
  final bool copyWith;

  /// Specify if the model of this specific type should have generated fromJson method in the resulting file
  final bool fromJson;

  /// Specify if the model of this specific type should have generated toJson method in the resulting file
  final bool toJson;

  ModelFluggerOptions({
    required this.name_sufix,
    required this.name_part_to_remove,
    required this.parent_folder_name,
    required this.copyWith,
    required this.fromJson,
    required this.toJson,
  });

  /// Default values for Request models
  factory ModelFluggerOptions.initialRequest() => ModelFluggerOptions(
        name_sufix: 'RequestModel',
        name_part_to_remove: 'Request',
        parent_folder_name: 'request_models',
        copyWith: true,
        fromJson: true,
        toJson: true,
      );

  /// Default values for Response models
  factory ModelFluggerOptions.initialResponse() => ModelFluggerOptions(
        name_sufix: 'ResponseModel',
        name_part_to_remove: 'Response',
        parent_folder_name: 'response_models',
        copyWith: false,
        fromJson: true,
        toJson: false,
      );

  /// Default values for Search models
  factory ModelFluggerOptions.initialSearch() => ModelFluggerOptions(
        name_sufix: 'SearchModel',
        name_part_to_remove: 'Search',
        parent_folder_name: 'search_models',
        copyWith: true,
        fromJson: false,
        toJson: true,
      );

  /// Default values for basic Model
  factory ModelFluggerOptions.initialModel() => ModelFluggerOptions(
        name_sufix: '',
        name_part_to_remove: '',
        parent_folder_name: 'models',
        copyWith: true,
        fromJson: true,
        toJson: true,
      );

  /// Parsing method used by this tool to parse the values from flugger.yaml file to strongly typed ModelFluggerOptions
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
