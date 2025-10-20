import 'package:flugger/flugger.dart';

/// FluggerWriter implementation to write all the generated into a structured folder/subfolder organized way
class StructuredFluggerWriter extends FluggerWriter {
  StructuredFluggerWriter({required super.options});

  /// Starts the process of writting the file/folders
  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {
    await super.write(results);

    for (final result in results) {
      final path = '${_resolveParentFolder(result)}${result.model.fileName}';

      if (result.imports.isEmpty) {
        await writeToFile(path, result.content);
      } else {
        await writeToFile(path, '${result.imports.join()}\n');
        await appendToFile(path, result.content);
      }
    }

    await super.finalWrite();
  }

  /// Resolves the name of the parent folder for the current file (FluggerModelType)
  String _resolveParentFolder(FluggerGeneratorResult result) {
    final parentFolder = switch (result.model.modelType) {
      FluggerModelType.REQUEST => _combinePath(
        options.models_output_path,
        options.request.parent_folder_name,
        'request_models',
        _resolveParentFolderMaybeByNamespace(result),
      ),
      FluggerModelType.RESPONSE => _combinePath(
        options.models_output_path,
        options.response.parent_folder_name,
        'response_models',
        _resolveParentFolderMaybeByNamespace(result),
      ),
      FluggerModelType.SEARCH => _combinePath(
        options.models_output_path,
        options.search.parent_folder_name,
        'search_models',
        _resolveParentFolderMaybeByNamespace(result),
      ),
      FluggerModelType.MODEL => _combinePath(
        options.models_output_path,
        options.model.parent_folder_name,
        'models',
        _resolveParentFolderMaybeByNamespace(result),
      ),
      FluggerModelType.ENUM => _combinePath(
        options.enums_output_path,
        options.enums.parent_folder_name,
        'enums',
      ),
      FluggerModelType.BASIC => throw UnsupportedError(
        'BASIC DATA TYPES SHOULD NOT BE GENERATED',
      ),
    };

    return parentFolder;
  }

  String _resolveParentFolderMaybeByNamespace(FluggerGeneratorResult result) =>
      result.model.namespace.isNotEmpty ? '${result.model.namespace}/' : '';
  String _combinePath(
    String basePath,
    String parentFolderName,
    String defaultParentFolderName, [
    String namespace = '',
  ]) =>
      '$basePath$namespace${_coallesceParentFolderName(parentFolderName, defaultParentFolderName)}/';
  String _coallesceParentFolderName(
    String parentFolderName,
    String defaultParentFolderName,
  ) => parentFolderName.isNotEmpty ? parentFolderName : defaultParentFolderName;
}
