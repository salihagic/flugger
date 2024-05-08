import 'package:flugger/flugger.dart';

/// Abstract class to be implemented by specific FluggerGenerator that generates the output model based on it's model type
abstract class FluggerGenerator {
  FluggerGeneratorResult generate(Model model);
}
