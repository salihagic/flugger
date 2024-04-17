// ignore_for_file: non_constant_identifier_names

import 'package:yaml/yaml.dart';

class SwaggerFluggerOptions {
  final String url;
  final String model_domain_prefix_to_remove;

  SwaggerFluggerOptions({
    required this.url,
    required this.model_domain_prefix_to_remove,
  });

  @override
  factory SwaggerFluggerOptions.fromYamlMap(YamlMap map) {
    return SwaggerFluggerOptions(
      url: map['url'] as String,
      model_domain_prefix_to_remove: map['model_domain_prefix_to_remove'] ?? '',
    );
  }
}
