// ignore_for_file: non_constant_identifier_names

import 'package:yaml/yaml.dart';

/// Swagger options to specify url from where to fetch models schema
class SwaggerFluggerOptions {
  /// URL as the source for swagger.json schema
  final String url;

  SwaggerFluggerOptions({
    required this.url,
  });

  /// Parsing method used by this tool to parse the values from flugger.yaml file to strongly typed SwaggerFluggerOptions
  @override
  factory SwaggerFluggerOptions.fromYamlMap(YamlMap map) {
    return SwaggerFluggerOptions(
      url: map['url'] as String,
    );
  }
}
