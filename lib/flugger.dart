library flugger;

import 'src/_all.dart';
export 'src/_all.dart';

class Flugger {
  final FluggerOptions options;
  final FluggerWriter writer;
  final SchemaRepository schemaRepository;

  Flugger({
    required this.options,
    required this.writer,
    required this.schemaRepository,
  });

  Future<void> execute() async {
    final models = await schemaRepository.get();
    final List<FluggerGeneratorResult> results = [];

    for (final model in models) {
      final result = _resolveGeneratorByDataType(model).generate(model);

      results.add(result);
    }

    await writer.write(results);
  }

  FluggerGenerator _resolveGeneratorByDataType(Model model) => switch (model.dataType) {
        FluggerDataType.OBJECT => _resolveModelGeneratorByModelType(model.modelType),
        _ => throw UnsupportedError('Generator for ${model.dataType} is not supported'),
      };

  FluggerGenerator _resolveModelGeneratorByModelType(FluggerModelType type) => switch (type) {
        FluggerModelType.RESPONSE => ResponseModelFluggerGenerator(options: options),
        FluggerModelType.REQUEST => RequestModelFluggerGenerator(options: options),
        FluggerModelType.SEARCH => SearchModelFluggerGenerator(options: options),
        FluggerModelType.MODEL => ModelFluggerGenerator(options: options),
      };
}
