import 'package:flugger/flugger.dart';

class OneFileFluggerWriter implements FluggerWriter {
  final FluggerOptions options;

  OneFileFluggerWriter({
    required this.options,
  });

  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {}
}
