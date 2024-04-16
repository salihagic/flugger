// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'dart:io';
import 'package:flugger/flugger.dart';
import 'package:flugger/src/_all.dart';
import 'package:yaml/yaml.dart';

Future<void> main(List<String> arguments) async {
  // final config = await loadConfig();
  final config = SwaggerGeneratorOptions(
    url: 'https://capi.portal.onedigital.de/swagger/v1/swagger.json',
    model_domain_prefix_to_remove: 'OneDigital.CustomerAPI.Endpoints',
  );

  await SwaggerGenerator(config).build();
}

Future<SwaggerGeneratorOptions> loadConfig() async {
  assert(await File('flugger.yaml').exists(), 'flugger.yaml config is missing from the root of the project');

  var yamlConfig = loadYaml(await File('flugger.yaml').readAsString());
  final config = SwaggerGeneratorOptions.fromYamlMap(yamlConfig['options']);

  log('LOADED CONFIGURATION from flugger.yaml');

  return config;
}
