import 'package:flugger/flugger.dart';
import 'package:yaml/yaml.dart';

/// Defines the structure of the output files/folders
class StructureFluggerOptions {
  /// Enum to specify the structure of the output files/folders
  final FluggerStructureType type;

  /// Convention:
  /// namespace: to specify if the grouping folder for files should be resolved from group endpoints (eg. Account models will be in account/ folder)
  /// type: to specify that all request models should be grouped in requests/ folder, response models grouped to responses/ folder and so on
  final FluggerFolderNamingConvention convention;

  StructureFluggerOptions({
    required this.type,
    required this.convention,
  });

  /// Default value for this class
  factory StructureFluggerOptions.initial() => StructureFluggerOptions(
        type: FluggerStructureType.structured,
        convention: FluggerFolderNamingConvention.namespace,
      );

  /// Parsing method used by this tool to parse the values from flugger.yaml file to strongly typed StructureFluggerOptions
  factory StructureFluggerOptions.fromYamlMap(YamlMap map) {
    return StructureFluggerOptions(
      type: FluggerStructureType.parse(map['structure']),
      convention: FluggerFolderNamingConvention.parse(map['convention']),
    );
  }
}
