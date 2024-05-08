import 'package:flugger/flugger.dart';

/// General model generator that implements FluggerGenerator
/// Generats output file for specific model and generates it's content based on the specified ModelFluggerOptions
class ModelFluggerGenerator implements FluggerGenerator {
  /// Used to fetch specified generic imports to be generated in the resulting file's content
  final FluggerOptions options;

  /// Specifies what methods should be generated
  final ModelFluggerOptions modelOptions;

  ModelFluggerGenerator({
    required this.options,
    required this.modelOptions,
  });

  /// Main generator method that starts the content generation based on options and modelOptions
  @override
  FluggerGeneratorResult generate(Model model) {
    return FluggerGeneratorResult(
      model: model,
      content: generateContent(model),
    );
  }

  /// Generates the concrete content of the output file
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

  /// Generates imports on the top of the output file
  String generateImports(Model model) {
    var content = '';

    for (final i in options.generic_imports) {
      content += 'import \'$i\';\n';
    }

    return content;
  }

  /// Generates the name of the class based on the models name
  String generateName(Model model) {
    return 'class ${model.name} {';
  }

  /// Generates properties for the specified model
  String generateProperties(Model model) {
    var content = '';

    for (final property in model.properties) {
      content += '  final ${property.type}${property.nullable ? '?' : ''} ${property.name};\n';
    }

    return content;
  }

  /// Generates the constructor for the model
  String generateConstructor(Model model) {
    var content = '';

    content += '  ${model.name}({\n';

    for (final property in model.properties) {
      content += '    ${property.nullable ? '' : 'required '}this.${property.name},\n';
    }

    content += '  });\n';

    return content;
  }

  /// Generates copyWith method
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

  /// Generates fromJson method
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

  /// Generates toJson method
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
