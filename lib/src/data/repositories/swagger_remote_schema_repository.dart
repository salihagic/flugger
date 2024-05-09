import 'package:dio/dio.dart';
import 'package:flugger/flugger.dart';

/// Swagger implementation of SchemaRepository that fetches the models schema from swagger.json and translates to local models
class SwaggerRemoteSchemaRepository implements SchemaRepository {
  /// Flugger options to read specified swagger url from where to fetch the schema
  final FluggerOptions options;

  /// http client to fetch the data
  final Dio dio;

  SwaggerRemoteSchemaRepository({
    required this.options,
    required this.dio,
  });

  @override
  Future<List<FluggerModel>> get() async {
    final response = await dio.get(options.swagger?.url ?? '');

    return _parseModels(response.data['components']['schemas']);
  }

  /// General swagger parse schema method
  Future<List<FluggerModel>> _parseModels(Map<String, dynamic> data) async {
    final models = data.entries
        .map<FluggerModel>(
          (entry) => FluggerModel.fromJson(entry.key, entry.value, options, true),
        )
        .toList();

    _updateModelsReferences(models);

    if (options.logging) {
      for (final model in models) {
        // ignore: avoid_print
        print('${model.toString()}\n');
      }
    }

    return models;
  }

  void _updateModelsReferences(List<FluggerModel> models) {
    final rootModels = models.where((x) => x.root).toList();

    for (final model in models) {
      _updateModelReferences(model, rootModels);
    }
  }

  void _updateModelReferences(FluggerModel model, List<FluggerModel> rootModels) {
    if (model is ObjectFluggerModel) {
      for (final property in model.properties) {
        if (property is ReferenceFluggerModel) {
          property.reference = rootModels.firstWhere((x) => x.id == property.id);
        }
      }
    }
  }
}
