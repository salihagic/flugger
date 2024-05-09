import 'package:flugger/flugger.dart';

/// Specific FluggerGenerator for models of ModelType Enum
class EnumFluggerGenerator extends FluggerGenerator {
  /// Main generator method that starts the content generation based on options and modelOptions
  @override
  FluggerGeneratorResult generate(FluggerModel model) {
    return FluggerGeneratorResult(
      model: model,
      content: 'ENUM CONTENT',
    );
  }
}
