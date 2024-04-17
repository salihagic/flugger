import 'package:flugger/flugger.dart';

class ResponseModelFluggerGenerator extends ModelFluggerGenerator {
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
}
