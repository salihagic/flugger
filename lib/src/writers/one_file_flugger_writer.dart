import 'package:flugger/flugger.dart';

class OneFileFluggerWriter extends FluggerWriter {
  OneFileFluggerWriter({
    required super.options,
  });

  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {}
}
