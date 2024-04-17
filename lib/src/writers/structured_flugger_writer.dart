import 'dart:io';

import 'package:flugger/flugger.dart';

class StructuredFluggerWriter implements FluggerWriter {
  final FluggerOptions options;

  StructuredFluggerWriter({
    required this.options,
  });

  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {
    for (final result in results) {
      final file = await File(
        '${options.destination_path_prefix}${_resolveParentFolder(result)}${result.model.fileName}',
      ).create(recursive: true);

      final fileConnectionSink = file.openWrite();

      fileConnectionSink.write(result.content);

      fileConnectionSink.close();
    }
  }

  String _resolveParentFolder(FluggerGeneratorResult result) => switch (options.structure.convention) {
        FluggerFolderNamingConvention.namespace => '/${(result.model.namespace != null && (result.model.namespace?.isNotEmpty ?? false)) ? result.model.namespace : _resolveParentFolderByModelType(result.model.modelType)}/',
        FluggerFolderNamingConvention.type => '/${_resolveParentFolderByModelType(result.model.modelType)}/',
      };

  String _resolveParentFolderByModelType(FluggerModelType modelType) => switch (modelType) {
        FluggerModelType.REQUEST => options.request.parent_folder_name.isNotEmpty ? options.request.parent_folder_name : 'request_models',
        FluggerModelType.RESPONSE => options.request.parent_folder_name.isNotEmpty ? options.request.parent_folder_name : 'response_models',
        FluggerModelType.SEARCH => options.request.parent_folder_name.isNotEmpty ? options.request.parent_folder_name : 'search_models',
        FluggerModelType.MODEL => options.model.parent_folder_name.isNotEmpty ? options.model.parent_folder_name : 'models',
      };
}
