import 'package:flugger/flugger.dart';

/// Abstract class to be implemented by specific input source repositories that fetch and transform the remote models schema to local list of models to be generated in the output destination
abstract class SchemaRepository {
  /// Method that gets the remote models schema and translates to local model object
  Future<List<FluggerModel>> get();
}
