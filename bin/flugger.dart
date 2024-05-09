import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flugger/flugger.dart';
import 'package:yaml/yaml.dart';

/// This is the entry point of this tool
/// This method gets executed once the command dart run flugger is run in the terminal of the project where the flugger package is installed in dev_dependencies
Future<void> main(List<String> arguments) async {
  final options = await loadOptions();

  final generator = Flugger(
    options: options,
    schemaRepository: resolveSchemaRepository(options),
    writer: resolveWriter(options),
  );

  generator.execute();
}

/// Loads Flugger Options from parent project's flugger.yaml file
Future<FluggerOptions> loadOptions() async {
  assert(await File('flugger.yaml').exists(),
      'flugger.yaml options is missing from the root of the project');

  var yamlOptions = loadYaml(await File('flugger.yaml').readAsString());

  return FluggerOptions.fromYamlMap(yamlOptions);
}

/// Resolved schema repository based on flugger.yaml options provided
/// Currently only implementation for SchemaRepository is SwaggerSchemaRepository which fetches swagger data and generates Flutter/Dart models based on it. Future implementations will provide more sources like .NET backend projects etc.
SchemaRepository resolveSchemaRepository(FluggerOptions options) {
  if (options.swagger != null) {
    return SwaggerSchemaRepository(
      options: options,
      dio: Dio(),
    );
  }

  throw UnsupportedError('Unsupported source');
}

/// Resolves a file/s writer based on the specified Flugger structure type in flugger.yaml file in the parent project which uses flugger as it's tool in dev_dependencies
FluggerWriter resolveWriter(FluggerOptions options) =>
    switch (options.structure.type) {
      FluggerStructureType.structured =>
        StructuredFluggerWriter(options: options),
      FluggerStructureType.all_in_one_file =>
        OneFileFluggerWriter(options: options),
      FluggerStructureType.all_in_one_folder =>
        OneFolderFluggerWriter(options: options),
    };
