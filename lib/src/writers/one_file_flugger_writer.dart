import 'package:flugger/flugger.dart';

/// FluggerWriter implementation to write all the generated content into one output file
/// [NOT IMPLEMENTED YET]
class OneFileFluggerWriter extends FluggerWriter {
  OneFileFluggerWriter({
    required super.options,
  });

  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {}
}
