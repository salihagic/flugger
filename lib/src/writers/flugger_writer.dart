import 'dart:io';

import 'package:flugger/flugger.dart';

/// Base FluggerWriter class that is used to write generated content into the output files/folders
class FluggerWriter {
  /// Specifies options to read for the desired output structure for generated files/folders
  final FluggerOptions options;

  FluggerWriter({
    required this.options,
  });

  /// Starts writing basic helper files, writes extensions file that is used by the models generated by this tool
  Future<void> write(List<FluggerGeneratorResult> results) async {
    await writeToFile(
      '${options.extensions_destination_path_prefix}/map_extensions.dart',
      mapExtensions,
    );
  }

  /// Helper method that executes at the end of tool generation process and creates barrel files (one _all.dart file per folder that exports all files from that folder so it's easier to import those models in the rest of the project)
  Future<void> finalWrite() async {
    await writeBarrelFilesAndExports(options.destination_path_prefix);
    await writeBarrelFilesAndExports(
        options.extensions_destination_path_prefix);
  }

  /// Helper method to write content to the file on specified path
  Future<void> writeToFile(String path, String content,
      [FileMode mode = FileMode.write]) async {
    final file = await File(path).create(recursive: true);

    final fileConnectionSink = file.openWrite(mode: mode);

    fileConnectionSink.write(content);

    fileConnectionSink.close();
  }

  /// Helper method to append content to the file on specified path
  Future<void> appendToFile(String path, String content) async {
    await writeToFile(path, content, FileMode.append);
  }

  /// Helper method to start the recursive process of listing all files in the specified folder (path) and generates _all.dart file which exports all the other files from that folder
  /// This process if done recursively for all subfolders
  Future<void> writeBarrelFilesAndExports(String path) async {
    final entities = await Directory(path).list().toList();
    final files = entities
        .whereType<File>()
        .where((file) => !file.path.endsWith('_all.dart'));
    final subdirectories = entities.whereType<Directory>();

    var content = '';

    for (final subdirectory in subdirectories) {
      writeBarrelFilesAndExports(subdirectory.formattedPath);
      content += 'export \'${subdirectory.formattedPathLast}/_all.dart\';\n';
    }

    for (final file in files) {
      content += 'export \'${file.formattedPathLast}\';\n';
    }

    addExport(path, content);
  }

  /// Helper method to add export file in specified path/folder
  Future<void> addExport(String path, String content) async {
    final barrelFilePath = '$path/_all.dart';

    writeToFile(barrelFilePath, content);
  }
}

extension _FileX on File? {
  String get formattedPath => this?.path.replaceAll('\\', '/') ?? '';
  String get formattedPathLast => formattedPath.split('/').last;
}

extension _DirectoryX on Directory? {
  String get formattedPath => this?.path.replaceAll('\\', '/') ?? '';
  String get formattedPathLast => formattedPath.split('/').last;
}
