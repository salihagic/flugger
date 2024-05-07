// ignore_for_file: non_constant_identifier_names

import 'package:yaml/yaml.dart';

class SwaggerFluggerOptions {
  final String url;

  SwaggerFluggerOptions({
    required this.url,
  });

  @override
  factory SwaggerFluggerOptions.fromYamlMap(YamlMap map) {
    return SwaggerFluggerOptions(
      url: map['url'] as String,
    );
  }
}
