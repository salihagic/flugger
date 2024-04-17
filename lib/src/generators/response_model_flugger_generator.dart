import 'package:flugger/flugger.dart';

class ResponseModelFluggerGenerator extends ClassFluggerGenerator {
  ResponseModelFluggerGenerator({
    required super.options,
  });

  @override
  String generateContent(Model model) {
    var content = '';

    content += '${generateImports(model)}\n\n';
    content += '${generateName(model)}\n';
    content += '${generateProperties(model)}\n\n';
    content += '${generateConstructor(model)}\n\n';
    content += '${generateFromJson(model)}\n';
    content += '}\n';

    return content;
  }

  @override
  String generateName(Model model) {
    return 'class ${model.name}${options.response.name_sufix} {';
  }

  @override
  String generateFromJson(Model model) => '// FromJson';
}
