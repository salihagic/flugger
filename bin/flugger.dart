import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flugger/flugger.dart';
import 'package:yaml/yaml.dart';

Future<void> main(List<String> arguments) async {
  final options = await loadOptions();

  final generator = Flugger(
    options: options,
    schemaRepository: resolveSchemaRepository(options),
    writer: resolveWriter(options),
  );

  generator.execute();
}

Future<FluggerOptions> loadOptions() async {
  // assert(await File('flugger.yaml').exists(), 'flugger.yaml options is missing from the root of the project');

  // var yamlOptions = loadYaml(await File('flugger.yaml').readAsString());

  // return FluggerOptions.fromYamlMap(yamlOptions);

  return FluggerOptions(
    structure: StructureFluggerOptions(
      type: FluggerStructureType.structured,
      convention: FluggerFolderNamingConvention.namespace,
    ),
    generic_imports: [
      'package:onedigital_customer/_all.dart',
    ],
    request: ModelFluggerOptions.initialRequest(),
    response: ModelFluggerOptions.initialResponse(),
    search: ModelFluggerOptions.initialSearch(),
    model: ModelFluggerOptions.initialModel(),
    destination_path_prefix: './lib/domain/models/generated/',
    extensions_destination_path_prefix: './lib/extensions/general/',
    swagger: SwaggerFluggerOptions(
      url: 'https://capi.portal.onedigital.de/swagger/v1/swagger.json',
    ),
  );
}

SchemaRepository resolveSchemaRepository(FluggerOptions options) {
  if (options.swagger != null) {
    return SwaggerSchemaRepository(
      options: options,
      dio: Dio(),
    );
  }

  throw UnsupportedError('Unsupported source');
}

FluggerWriter resolveWriter(FluggerOptions options) => switch (options.structure.type) {
      FluggerStructureType.structured => StructuredFluggerWriter(options: options),
      FluggerStructureType.all_in_one_file => OneFileFluggerWriter(options: options),
      FluggerStructureType.all_in_one_folder => OneFolderFluggerWriter(options: options),
    };
