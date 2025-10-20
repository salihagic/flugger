import 'package:flugger/flugger.dart';

/// FluggerWriter implementation to write all the generated content into one output folder
/// [NOT IMPLEMENTED YET]
class OneFolderFluggerWriter extends FluggerWriter {
  OneFolderFluggerWriter({required super.options});

  /// Starts the process of writting the file/folders
  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {
    await super.write(results);

    for (final result in results) {
      final path = '${options.models_output_path}${result.model.fileName}';

      if (result.imports.isEmpty) {
        await writeToFile(path, result.content);
      } else {
        await writeToFile(path, '${result.imports.join()}\n');
        await appendToFile(path, result.content);
      }
    }

    await super.finalWrite();
  }
}
