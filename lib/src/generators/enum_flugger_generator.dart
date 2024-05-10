import 'package:flugger/flugger.dart';

// enum AssetClass {
//   equity(1),
//   fixedIncome(2),
//   cashAndEquivalent(3),
//   realEstate(4),
//   commodity(5),
//   preciousMetal(6),
//   collectibleAndAlternative(7),
//   cryptocurrency(8),
//   hedgeFund(9),
//   privateEquity(10),
//   derivates(11);

//   final int value;
//   const AssetClass([this.value = 1]);
//   static AssetClass? parse(int? index) => AssetClass.values.firstOrDefault((x) => x.value == index);
// }

/// Specific FluggerGenerator for models of ModelType Enum
class EnumFluggerGenerator extends FluggerGenerator {
  /// Used to fetch specified generic imports to be generated in the resulting file's content
  final FluggerOptions options;

  /// Specifies what methods should be generated
  final EnumFluggerOptions modelOptions;

  EnumFluggerGenerator({
    required this.options,
    required this.modelOptions,
  });

  /// Main generator method that starts the content generation based on options and modelOptions
  @override
  FluggerGeneratorResult generate(FluggerModel model) {
    final enumFluggerModel = model as EnumFluggerModel;

    return FluggerGeneratorResult(
      model: model,
      imports: generateImports(enumFluggerModel),
      content: generateContent(enumFluggerModel),
    );
  }

  /// Generates the concrete content of the output file
  String generateContent(EnumFluggerModel model) {
    var content = '';

    content += '${generateName(model)}\n';
    content += '${generateValues(model)}\n';
    content += '${generateValueProp(model)}\n';
    content += generateConstructor(model);

    if (modelOptions.parse) {
      content += '\n${generateParse(model)}';
    }

    content += '}\n';

    return content;
  }

  /// Generates imports on the top of the output file
  List<String> generateImports(EnumFluggerModel model) {
    final imports = <String>[];

    for (final i in options.generic_imports) {
      imports.add('import \'$i\';\n');
    }

    return imports.toSet().toList();
  }

  /// Generates the name of the class based on the models name
  String generateName(EnumFluggerModel model) {
    return 'enum ${model.generateEnumName()} {';
  }

  /// Generates properties for the specified model
  String generateValues(EnumFluggerModel model) {
    var content = '';

    for (var i = 0; i < model.values.length; i++) {
      final value = model.values[i];
      final isLast = i == model.values.length - 1;

      content +=
          '  ${model.generateEnumName().toLowerCase()}$value($value)${isLast ? ';' : ','}\n';
    }

    return content;
  }

  /// Generates the value property for enum
  String generateValueProp(EnumFluggerModel model) {
    return '  final ${model.generateEnumDataType()} value;\n';
  }

  /// Generates the constructor for the model
  String generateConstructor(EnumFluggerModel model) {
    return '  const ${model.generateEnumName()}([this.value = ${model.values.first}]);\n';
  }

  /// Generates parse method
  String generateParse(EnumFluggerModel model) {
    return '  static ${model.generateEnumName()}? parse(${model.generateEnumDataType()}? index) => ${model.generateEnumName()}.values.firstOrDefault((x) => x.value == index);\n';
  }
}
