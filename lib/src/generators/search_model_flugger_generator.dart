import 'package:flugger/flugger.dart';

class SearchModelFluggerGenerator extends ModelFluggerGenerator {
  SearchModelFluggerGenerator({
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
}
