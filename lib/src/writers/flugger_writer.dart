import 'package:flugger/flugger.dart';

abstract class FluggerWriter {
  Future<void> write(List<FluggerGeneratorResult> results);
}
