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
      await writeToFile(
        '${options.destination_path_prefix}${_resolveParentFolder(result)}${result.model.fileName}',
        result.content,
      );
    }

    await super.finalWrite();
  }

  /// Resolves the name of the parent folder for the current file (FluggerGeneratorResult)
  String _resolveParentFolder(FluggerGeneratorResult result) => switch (options.structure.convention) {
        FluggerFolderNamingConvention.namespace => '${_resolveParentFolderByNamespace(result)}/${_resolveParentFolderByModelType(result.model.modelType)}/',
        FluggerFolderNamingConvention.type => '/${_resolveParentFolderByModelType(result.model.modelType)}/',
      };

  /// Resolves the name of the parent folder for the current file (FluggerGeneratorResult)
  String _resolveParentFolderByNamespace(FluggerGeneratorResult result) => (result.model.namespace != null && (result.model.namespace?.isNotEmpty ?? false)) ? '/${result.model.namespace}' : '';

  /// Resolves the name of the parent folder for the current file (FluggerModelType)
  String _resolveParentFolderByModelType(FluggerModelType modelType) => switch (modelType) {
        FluggerModelType.REQUEST => options.request.parent_folder_name.isNotEmpty ? options.request.parent_folder_name : 'request_models',
        FluggerModelType.RESPONSE => options.response.parent_folder_name.isNotEmpty ? options.response.parent_folder_name : 'response_models',
        FluggerModelType.SEARCH => options.search.parent_folder_name.isNotEmpty ? options.search.parent_folder_name : 'search_models',
        FluggerModelType.MODEL => options.model.parent_folder_name.isNotEmpty ? options.model.parent_folder_name : 'models',
      };
}
