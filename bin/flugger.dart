import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flugger/flugger.dart';
import 'package:yaml/yaml.dart';

/// This is the entry point of this tool
/// This method gets executed once the command dart run flugger is run in the terminal of the project where the flugger package is installed in dev_dependencies
Future<void> main(List<String> arguments) async {
  // final options = await loadOptionsForLocalTesting();
  final options = await loadOptions();

  final generator = Flugger(
    pOptions: options,
    schemaRepository: resolveSchemaRepository(options),
    writer: resolveWriter(options),
    logger: resolveLogger(options),
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

/// Loads local Flugger options for testing purposes
Future<FluggerOptions> loadOptionsForLocalTesting() async {
  return FluggerOptions(
    structure: FluggerStructureType.one_folder,
    generic_imports: [
      'package:officeconnect/extensions/extensions.dart',
    ],
    models_to_ignore: [],
    request: ModelFluggerOptions.initialRequest(),
    response: ModelFluggerOptions.initialResponse(),
    search: ModelFluggerOptions.initialSearch(),
    model: ModelFluggerOptions.initialModel(),
    enums: EnumFluggerOptions.initial(),
    models_output_path: './lib/gen/',
    enums_output_path: './lib/gen/',
    extensions_output_path: './lib/gen/',
    url: 'https://w31xnq57-8006.euw.devtunnels.ms/swagger/v1/swagger.json',
    logging: true,
  );
}

/// Resolved schema repository based on flugger.yaml options provided
SchemaRepository resolveSchemaRepository(FluggerOptions options) {
  if (options.url != null) {
    return SwaggerRemoteSchemaRepository(
      options: options,
      dio: Dio(),
      logger: resolveLogger(options),
    );
  }

  throw UnsupportedError('Unsupported source');
}

/// Resolves a file/s writer based on the specified Flugger structure type in flugger.yaml file in the parent project which uses flugger as it's tool in dev_dependencies
FluggerWriter resolveWriter(FluggerOptions options) =>
    switch (options.structure) {
      FluggerStructureType.structured =>
        StructuredFluggerWriter(options: options),
      FluggerStructureType.one_file => OneFileFluggerWriter(options: options),
      FluggerStructureType.one_folder =>
        OneFolderFluggerWriter(options: options),
    };

/// Resolves a logger based on configuration
Logger resolveLogger(FluggerOptions options) =>
    options.logging ? LoggerImpl(options: options) : EmptyLoggerImpl();
