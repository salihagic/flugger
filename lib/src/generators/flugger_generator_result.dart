import 'package:flugger/flugger.dart';

/// Result class for generated content for specific model
class FluggerGeneratorResult {
  final FluggerModel model;
  final List<String> imports;
  final String content;

  FluggerGeneratorResult({
    required this.model,
    required this.imports,
    required this.content,
  });
}
