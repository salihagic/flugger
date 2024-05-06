import 'package:flugger/flugger.dart';

class ModelFluggerGenerator implements FluggerGenerator {
  final FluggerOptions options;
  final ModelFluggerOptions modelOptions;

  ModelFluggerGenerator({
    required this.options,
    required this.modelOptions,
  });

  @override
  FluggerGeneratorResult generate(Model model) {
    return FluggerGeneratorResult(
      model: model,
      content: generateContent(model),
    );
  }

  String generateContent(Model model) {
    var content = '';

    content += '${generateImports(model)}\n';
    content += '${generateName(model)}\n';
    content += '${generateProperties(model)}\n';
    content += generateConstructor(model);

    if (modelOptions.copyWith) {
      content += '\n${generateCopyWith(model)}';
    }

    if (modelOptions.fromJson) {
      content += '\n${generateFromJson(model)}';
    }

    if (modelOptions.toJson) {
      content += '\n${generateToJson(model)}';
    }

    content += '}\n';

    return content;
  }

  String generateImports(Model model) {
    var content = '';

    for (final i in options.generic_imports) {
      content += 'import \'$i\';\n';
    }

    return content;
  }

  String generateName(Model model) {
    return 'class ${model.name} {';
  }

  String generateProperties(Model model) {
    var content = '';

    for (final property in model.properties) {
      content += '  final ${property.type}${property.nullable ? '?' : ''} ${property.name};\n';
    }

    return content;
  }

  String generateConstructor(Model model) {
    var content = '';

    content += '  ${model.name}({\n';

    for (final property in model.properties) {
      content += '    ${property.nullable ? '' : 'required '}this.${property.name},\n';
    }

    content += '  });\n';

    return content;
  }

  String generateCopyWith(Model model) {
    var content = '';

    content += '  ${model.name} copyWith({\n';
    for (final property in model.properties) {
      content += '    ${property.type}? ${property.name},\n';
    }
    content += '  }) {\n';
    content += '    return ${model.name}(\n';
    for (final property in model.properties) {
      content += '      ${property.name}: ${property.name} ?? this.${property.name},\n';
    }
    content += '    );\n';
    content += '  }\n';

    return content;
  }

  String generateFromJson(Model model) {
    var content = '';

    content += '  factory ${model.name}.fromMap(Map<String, dynamic> map) {\n';
    content += '    return ${model.name}(\n';
    for (final property in model.properties) {
      content += '      ${property.name}: map.parseValue(\'${property.name}\'),\n';
    }
    content += '    );\n';
    content += '  }\n';

    return content;
  }

  String generateToJson(Model model) {
    var content = '';

    content += '  Map<String, dynamic> toMap() {\n';
    content += '    return <String, dynamic>{\n';
    for (final property in model.properties) {
      content += '      \'${property.name}\': ${property.name},\n';
    }
    content += '    };\n';
    content += '  }\n';

    return content;
  }
}
