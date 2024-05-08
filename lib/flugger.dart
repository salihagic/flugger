library flugger;

import 'src/_all.dart';
export 'src/_all.dart';

/// Main class of this tool, unifies options, writer and schema repository and starts the process of generating the models and writing specific files
class Flugger {
  /// Flugger options to specify desired input and output parameters
  final FluggerOptions options;

  /// Resolved writed based on the input parameters
  /// Output's a specific folder/file structure that is specified in flugger.yaml
  final FluggerWriter writer;

  /// Schema repository fetches or resolves the list of models based on the input source (currently only available is swagger)
  final SchemaRepository schemaRepository;

  Flugger({
    required this.options,
    required this.writer,
    required this.schemaRepository,
  });

  Future<void> execute() async {
    /// Fetches the models to be used in the generators
    final models = await schemaRepository.get();
    final List<FluggerGeneratorResult> results = [];

    for (final model in models) {
      final result = _resolveGeneratorByDataType(model).generate(model);

      results.add(result);
    }

    await writer.write(results);
  }

  /// Currently only OBJECT type generators are supported eg. classes from the input source will be translated and generated into Flutter/Dart classes with specific methods/properties
  /// Additionaly support for generating Enums will be added
  FluggerGenerator _resolveGeneratorByDataType(Model model) =>
      switch (model.dataType) {
        FluggerDataType.OBJECT =>
          _resolveModelGeneratorByModelType(model.modelType),
        _ => throw UnsupportedError(
            'Generator for ${model.dataType} is not supported'),
      };

  /// Resolves model generator based the current Model type from the parsed model (options are: Response, Request, Search and basic Model)
  FluggerGenerator _resolveModelGeneratorByModelType(FluggerModelType type) =>
      switch (type) {
        FluggerModelType.RESPONSE => ResponseModelFluggerGenerator(
            options: options, modelOptions: options.response),
        FluggerModelType.REQUEST => RequestModelFluggerGenerator(
            options: options, modelOptions: options.response),
        FluggerModelType.SEARCH => SearchModelFluggerGenerator(
            options: options, modelOptions: options.response),
        FluggerModelType.MODEL => ModelFluggerGenerator(
            options: options, modelOptions: options.response),
      };
}
