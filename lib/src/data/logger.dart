import 'package:flugger/flugger.dart';

abstract class Logger {
  void log([String prefix = '', String content = '']);
  void logModel(FluggerModel model, [String prefix = '']);
}

class LoggerImpl implements Logger {
  final FluggerOptions options;

  LoggerImpl({
    required this.options,
  });

  @override
  void log([String prefix = '', String content = '']) {
    if (options.logging) {
      // ignore: avoid_print
      print('$prefix [$content]');
    }
  }

  @override
  void logModel(FluggerModel model, [String prefix = '']) {
    if (options.logging) {
      // ignore: avoid_print
      print('$prefix [${model.transformedOriginalDataType}]');
    }
  }
}

class EmptyLoggerImpl implements Logger {
  @override
  void log([String prefix = '', String content = '']) {}

  @override
  void logModel(FluggerModel model, [String prefix = '']) {}
}
