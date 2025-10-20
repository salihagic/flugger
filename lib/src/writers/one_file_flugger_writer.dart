import 'package:flugger/flugger.dart';

/// FluggerWriter implementation to write all the generated content into one output file
/// [NOT IMPLEMENTED YET]
class OneFileFluggerWriter extends FluggerWriter {
  OneFileFluggerWriter({required super.options});

  /// Starts the process of writting the file/folders
  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {
    final path = '${options.models_output_path}/generated.dart';
    final imports = results.expand((result) => result.imports).toSet().toList()
      ..add(mapExtensionsImport);

    await writeToFile(path, '${imports.join()}\n\n');

    for (final result in results) {
      await appendToFile(path, result.content);
    }

    await appendToFile(path, mapExtensionsWithoutImports);
    await appendToFile(path, listExtensions);
  }
}
