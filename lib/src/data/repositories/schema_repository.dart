import 'package:flugger/src/data/models/model.dart';

abstract class SchemaRepository {
  Future<List<Model>> get();
}
