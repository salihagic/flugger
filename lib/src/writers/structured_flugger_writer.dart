import 'package:flugger/flugger.dart';

/// FluggerWriter implementation to write all the generated into a structured folder/subfolder organized way
class StructuredFluggerWriter extends FluggerWriter {
  StructuredFluggerWriter({
    required super.options,
  });

  /// Starts the process of writting the file/folders
  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {
    await super.write(results);

    for (final result in results) {
      final path =
          '${options.models_output_path}${_resolveParentFolder(result)}${result.model.fileName}';

      if (result.imports.isEmpty) {
        await writeToFile(path, result.content);
      } else {
        await writeToFile(path, '${result.imports.join()}\n');
        await appendToFile(path, result.content);
      }
    }

    await super.finalWrite();
  }

  /// Resolves the name of the parent folder for the current file (FluggerGeneratorResult)
  String _resolveParentFolder(FluggerGeneratorResult result) =>
      switch (options.structure.convention) {
        FluggerFolderNamingConvention.namespace =>
          '${_resolveParentFolderByNamespace(result)}/${_resolveParentFolderByModelType(result.model.modelType)}/',
        FluggerFolderNamingConvention.type =>
          '/${_resolveParentFolderByModelType(result.model.modelType)}/',
      };

  /// Resolves the name of the parent folder for the current file (FluggerGeneratorResult)
  String _resolveParentFolderByNamespace(FluggerGeneratorResult result) =>
      result.model.namespace.isNotEmpty ? '/${result.model.namespace}' : '';

  /// Resolves the name of the parent folder for the current file (FluggerModelType)
  String _resolveParentFolderByModelType(FluggerModelType modelType) =>
      switch (modelType) {
        FluggerModelType.REQUEST =>
          options.request.parent_folder_name.isNotEmpty
              ? options.request.parent_folder_name
              : 'request_models',
        FluggerModelType.RESPONSE =>
          options.response.parent_folder_name.isNotEmpty
              ? options.response.parent_folder_name
              : 'response_models',
        FluggerModelType.SEARCH => options.search.parent_folder_name.isNotEmpty
            ? options.search.parent_folder_name
            : 'search_models',
        FluggerModelType.MODEL => options.model.parent_folder_name.isNotEmpty
            ? options.model.parent_folder_name
            : 'models',
        FluggerModelType.ENUM => options.enums.parent_folder_name.isNotEmpty
            ? options.enums.parent_folder_name
            : 'enums',
        FluggerModelType.BASIC =>
          throw UnsupportedError('BASIC DATA TYPES SHOULD NOT BE GENERATED'),
      };
}
