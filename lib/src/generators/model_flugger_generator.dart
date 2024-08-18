import 'package:flugger/flugger.dart';

/// General model generator that implements FluggerGenerator
/// Generats output file for specific model and generates it's content based on the specified ModelFluggerOptions
class ModelFluggerGenerator implements FluggerGenerator {
  /// Used to fetch specified generic imports to be generated in the resulting file's content
  final FluggerOptions options;

  /// Specifies what methods should be generated
  final ModelFluggerOptions modelOptions;

  final Logger logger;

  ModelFluggerGenerator({
    required this.options,
    required this.modelOptions,
    required this.logger,
  });

  /// Main generator method that starts the content generation based on options and modelOptions
  @override
  FluggerGeneratorResult generate(FluggerModel model) {
    final objectFluggerModel = model as ObjectFluggerModel;

    logger.logModel(model, 'GENERATING CONTENT');

    return FluggerGeneratorResult(
      model: model,
      imports: generateImports(objectFluggerModel),
      content: generateContent(objectFluggerModel),
    );
  }

  /// Generates the concrete content of the output file
  String generateContent(ObjectFluggerModel model) {
    var content = '';

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
  List<String> generateImports(ObjectFluggerModel model) {
    final imports = <String>[];

    if (modelOptions.fromJson ||
        model.properties.any((x) =>
            [
              FluggerDataType.OBJECT,
              FluggerDataType.REFERENCE,
              FluggerDataType.ENUM,
            ].contains(x.dataType) ||
            (x is ListFluggerModel &&
                [
                  FluggerDataType.OBJECT,
                  FluggerDataType.REFERENCE,
                  FluggerDataType.ENUM,
                ].contains(x.templateDataType?.dataType)))) {
      for (final i in options.generic_imports) {
        imports.add('import \'$i\';\n');
      }
    }

    return imports.toSet().toList();
  }

  /// Generates the name of the class based on the models name
  String generateName(ObjectFluggerModel model) {
    return 'class ${model.generateClassName()} {';
  }

  /// Generates properties for the specified model
  String generateProperties(ObjectFluggerModel model) {
    var content = '';

    for (final property in model.properties) {
      content +=
          '  final ${property.generatePropertyType()}${property.generateNullableSign()} ${property.generatePropertyName()};\n';
    }

    return content;
  }

  /// Generates the constructor for the model
  String generateConstructor(ObjectFluggerModel model) {
    var content = '';

    content += '  ${model.generateClassName()}({\n';

    for (final property in model.properties) {
      content +=
          '    ${property.generateRequired()}this.${property.generatePropertyName()},\n';
    }

    content += '  });\n';

    return content;
  }

  /// Generates copyWith method
  String generateCopyWith(ObjectFluggerModel model) {
    var content = '';

    content += '  ${model.generateClassName()} copyWith({\n';
    for (final property in model.properties) {
      content +=
          '    ${property.generatePropertyType()}? ${property.generatePropertyName()},\n';
    }
    content += '  }) {\n';
    content += '    return ${model.generateClassName()}(\n';
    for (final property in model.properties) {
      content +=
          '      ${property.generatePropertyName()}: ${property.generatePropertyName()} ?? this.${property.generatePropertyName()},\n';
    }
    content += '    );\n';
    content += '  }\n';

    return content;
  }

  /// Generates fromJson method
  String generateFromJson(ObjectFluggerModel model) {
    var content = '';

    content +=
        '  factory ${model.generateClassName()}.fromJson(Map<String, dynamic> json) {\n';
    content += '    return ${model.generateClassName()}(\n';
    for (final property in model.properties) {
      final parseMethod = switch (property.dataType) {
        FluggerDataType.STRING => property.generateParseMethod(),
        FluggerDataType.DATETIME => property.generateParseMethod(),
        FluggerDataType.INT => property.generateParseMethod(),
        FluggerDataType.DOUBLE => property.generateParseMethod(),
        FluggerDataType.BOOL => property.generateParseMethod(),
        FluggerDataType.LIST => property.generateParseMethod(),
        FluggerDataType.ENUM => property.generateParseMethod(),
        FluggerDataType.OBJECT => property.generateParseMethod(),
        FluggerDataType.REFERENCE => property.generateParseMethod(),
      };

      content +=
          '      ${property.generatePropertyName()}: json.$parseMethod,\n';
    }
    content += '    );\n';
    content += '  }\n';

    return content;
  }

  /// Generates toJson method
  String generateToJson(ObjectFluggerModel model) {
    var content = '';

    content += '  Map<String, dynamic> toJson() {\n';
    content += '    return <String, dynamic>{\n';
    for (final property in model.properties) {
      content +=
          '      if(${property.generatePropertyName()} != null) \'${property.generatePropertyName()}\': ${property.generatePropertyName()},\n';
    }
    content += '    };\n';
    content += '  }\n';

    return content;
  }
}
