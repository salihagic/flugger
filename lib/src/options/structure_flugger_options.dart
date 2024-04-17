import 'package:flugger/flugger.dart';
import 'package:yaml/yaml.dart';

class StructureFluggerOptions {
  final FluggerStructureType type;
  final FluggerFolderNamingConvention convention;

  StructureFluggerOptions({
    required this.type,
    required this.convention,
  });

  factory StructureFluggerOptions.initial() => StructureFluggerOptions(
        type: FluggerStructureType.structured,
        convention: FluggerFolderNamingConvention.namespace,
      );

  factory StructureFluggerOptions.fromYamlMap(YamlMap map) {
    return StructureFluggerOptions(
      type: FluggerStructureType.parse(map['structure']),
      convention: FluggerFolderNamingConvention.parse(map['convention']),
    );
  }
}
