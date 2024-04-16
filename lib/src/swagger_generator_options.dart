// ignore_for_file: non_constant_identifier_names

import 'package:yaml/yaml.dart';

class SwaggerGeneratorOptions {
  final String url;
  final String? model_domain_prefix_to_remove;

  SwaggerGeneratorOptions({
    required this.url,
    this.model_domain_prefix_to_remove,
  });

  factory SwaggerGeneratorOptions.fromYamlMap(YamlMap map) {
    return SwaggerGeneratorOptions(
      url: map['url'] as String,
      model_domain_prefix_to_remove: map['model_domain_prefix_to_remove'] ?? '',
    );
  }
}
