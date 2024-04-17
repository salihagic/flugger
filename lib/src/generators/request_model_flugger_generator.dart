import 'package:flugger/flugger.dart';

class RequestModelFluggerGenerator extends ClassFluggerGenerator {
  RequestModelFluggerGenerator({
    required super.options,
  });

  @override
  String generateContent(Model model) {
    var content = '';

    content += '${generateImports(model)}\n';
    content += '${generateName(model)}\n';
    content += '${generateProperties(model)}\n';
    content += '${generateConstructor(model)}\n';
    content += '${generateCopyWith(model)}\n';
    content += generateToJson(model);
    content += '}\n';

    return content;
  }

  @override
  String generateName(Model model) {
    return 'class ${model.name} {';
  }

  @override
  String generateCopyWith(Model model) {
    var content = '';

    content += '  ${model.name} copyWith({\n';
    for (final property in model.properties) {
      content += '    ${property.dataType.value}? ${property.name},\n';
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

  @override
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
