library flugger;

import 'src/_all.dart';
export 'src/_all.dart';

/// Flugger options to specify desired input and output parameters
late FluggerOptions options;

/// Main class of this tool, unifies options, writer and schema repository and starts the process of generating the models and writing specific files
class Flugger {
  /// Resolved writed based on the input parameters
  /// Output's a specific folder/file structure that is specified in flugger.yaml
  final FluggerWriter writer;

  /// Schema repository fetches or resolves the list of models based on the input source (currently only available is swagger)
  final SchemaRepository schemaRepository;

  Flugger({
    required FluggerOptions pOptions,
    required this.writer,
    required this.schemaRepository,
  }) {
    options = pOptions;
  }

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

  FluggerGenerator _resolveGeneratorByDataType(FluggerModel model) => switch (model.dataType) {
        FluggerDataType.OBJECT => _resolveModelGeneratorByModelType(model.modelType),
        FluggerDataType.ENUM => _resolveModelGeneratorByModelType(model.modelType),
        _ => throw UnsupportedError('Generator for ${model.dataType} is not supported'),
      };

  /// Resolves model generator based the current Model type from the parsed model
  FluggerGenerator _resolveModelGeneratorByModelType(FluggerModelType type) => switch (type) {
        FluggerModelType.RESPONSE => ResponseModelFluggerGenerator(options: options, modelOptions: options.response),
        FluggerModelType.REQUEST => RequestModelFluggerGenerator(options: options, modelOptions: options.request),
        FluggerModelType.SEARCH => SearchModelFluggerGenerator(options: options, modelOptions: options.search),
        FluggerModelType.MODEL => ModelFluggerGenerator(options: options, modelOptions: options.model),
        FluggerModelType.ENUM => EnumFluggerGenerator(options: options, modelOptions: options.enums),
        FluggerModelType.BASIC => throw UnsupportedError('GENERATOR FOR BASIC DATA TYPES ARE NOT VALID'),
      };
}
