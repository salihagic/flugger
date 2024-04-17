import 'package:flugger/flugger.dart';

class ClassFluggerGenerator implements FluggerGenerator {
  final FluggerOptions options;

  ClassFluggerGenerator({
    required this.options,
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
    content += '${generateProperties(model)}\n\n';
    content += '${generateConstructor(model)}\n\n';
    content += '${generateCopyWith(model)}\n\n';
    content += '${generateFromJson(model)}\n\n';
    content += '${generateToJson(model)}\n';
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

  String generateName(Model model) => '// Name';

  String generateProperties(Model model) {
    var content = '';

    for (final property in model.properties) {
      content += '  final ${property.dataType.value}${property.nullable ? '?' : ''} ${property.name};\n';
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

  String generateCopyWith(Model model) => '// CopyWith';
  String generateFromJson(Model model) => '// FromJson';
  String generateToJson(Model model) => '// ToJson';
}
