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

    content += '  factory ${model.name}.fromJson(Map<String, dynamic> json) {\n';
    content += '    return ${model.name}(\n';
    for (final property in model.properties) {
      final parseMethod = switch (property.dataType) {
        FluggerDataType.STRING => 'parseValue(\'${property.name}\')',
        FluggerDataType.DATETIME => 'parseDate(\'${property.name}\')',
        FluggerDataType.INT => 'parseValue(\'${property.name}\')',
        FluggerDataType.DOUBLE => 'parseDouble(\'${property.name}\')',
        FluggerDataType.BOOL => 'parseValue(\'${property.name}\')',
        FluggerDataType.LIST => 'parseList(\'${property.name}\'${property.templateDataType != null ? ', ${property.type}.fromJson' : ''})',
        FluggerDataType.ENUM => 'parseEnum(\'${property.name}\', ${property.type}.parse)',
        FluggerDataType.OBJECT => 'parse(\'${property.name}\', ${property.type}.fromJson)',
      };

      content += '      ${property.name}: json.$parseMethod,\n';
    }
    content += '    );\n';
    content += '  }\n';

    return content;
  }

  String generateToJson(Model model) {
    var content = '';

    content += '  Map<String, dynamic> toJson() {\n';
    content += '    return <String, dynamic>{\n';
    for (final property in model.properties) {
      content += '      \'${property.name}\': ${property.name},\n';
    }
    content += '    };\n';
    content += '  }\n';

    return content;
  }
}
