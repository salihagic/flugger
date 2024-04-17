import 'package:flugger/flugger.dart';

class OneFolderFluggerWriter implements FluggerWriter {
  final FluggerOptions options;

  OneFolderFluggerWriter({
    required this.options,
  });

  @override
  Future<void> write(List<FluggerGeneratorResult> results) async {}
}
