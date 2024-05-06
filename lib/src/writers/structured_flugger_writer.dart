import 'package:flugger/flugger.dart';

class StructuredFluggerWriter extends FluggerWriter {
  StructuredFluggerWriter({
    required super.options,
  });

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

  String _resolveParentFolder(FluggerGeneratorResult result) => switch (options.structure.convention) {
        FluggerFolderNamingConvention.namespace => '${_resolveParentFolderByNamespace(result)}/${_resolveParentFolderByModelType(result.model.modelType)}/',
        FluggerFolderNamingConvention.type => '/${_resolveParentFolderByModelType(result.model.modelType)}/',
      };

  String _resolveParentFolderByNamespace(FluggerGeneratorResult result) => (result.model.namespace != null && (result.model.namespace?.isNotEmpty ?? false)) ? '/${result.model.namespace}' : '';

  String _resolveParentFolderByModelType(FluggerModelType modelType) => switch (modelType) {
        FluggerModelType.REQUEST => options.request.parent_folder_name.isNotEmpty ? options.request.parent_folder_name : 'request_models',
        FluggerModelType.RESPONSE => options.response.parent_folder_name.isNotEmpty ? options.response.parent_folder_name : 'response_models',
        FluggerModelType.SEARCH => options.search.parent_folder_name.isNotEmpty ? options.search.parent_folder_name : 'search_models',
        FluggerModelType.MODEL => options.model.parent_folder_name.isNotEmpty ? options.model.parent_folder_name : 'models',
      };
}
