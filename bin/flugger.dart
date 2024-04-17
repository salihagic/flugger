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
  assert(await File('flugger.yaml').exists(), 'flugger.yaml options is missing from the root of the project');

  var yamlOptions = loadYaml(await File('flugger.yaml').readAsString());

  return FluggerOptions.fromYamlMap(yamlOptions);

  // return FluggerOptions(
  //   structure: FluggerStructureType.structured,
  //   generic_imports: [
  //     'package:onedigital_customer/_all.dart',
  //     'package:onedigital_customer/_all.dart',
  //     'package:onedigital_customer/_all.dart',
  //   ],
  //   request: ModelFluggerOptions(
  //     name_part_to_remove: 'Request',
  //     name_sufix: 'RequestModel',
  //   ),
  //   response: ModelFluggerOptions(
  //     name_part_to_remove: 'Response',
  //     name_sufix: 'ResponseModel',
  //   ),
  //   search: ModelFluggerOptions(
  //     name_part_to_remove: 'Search',
  //     name_sufix: 'SearchModel',
  //   ),
  //   destination_path_prefix: './lib/domain/models/generated/',
  //   swagger: SwaggerFluggerOptions(
  //     url: 'https://capi.portal.onedigital.de/swagger/v1/swagger.json',
  //     model_domain_prefix_to_remove: 'OneDigital.CustomerAPI.Endpoints',
  //   ),
  // );
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
