import 'package:flugger/flugger.dart';

/// FluggerWriter implementation to write all the generated content into one output folder
/// [NOT IMPLEMENTED YET]
class OneFolderFluggerWriter extends FluggerWriter {
  OneFolderFluggerWriter({
    required super.options,
  });

  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {}
}
