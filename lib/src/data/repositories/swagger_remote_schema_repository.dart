import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flugger/flugger.dart';

/// Swagger implementation of SchemaRepository that fetches the models schema from swagger.json and translates to local models
class SwaggerRemoteSchemaRepository implements SchemaRepository {
  /// Flugger options to read specified swagger url from where to fetch the schema
  final FluggerOptions options;

  /// http client to fetch the data
  final Dio dio;

  final Logger logger;

  SwaggerRemoteSchemaRepository({
    required this.options,
    required this.dio,
    required this.logger,
  });

  @override
  Future<List<FluggerModel>> get() async {
    final response = await dio.get(options.url ?? '');

    final data =
        response.data is String ? json.decode(response.data) : response.data;

    return _parseModels(data['components']['schemas']);
  }

  /// General swagger parse schema method
  Future<List<FluggerModel>> _parseModels(Map<String, dynamic> data) async {
    final models = data.entries
        .map<FluggerModel>((entry) {
          logger.log('PARSING MODEL', entry.key);

          return FluggerModel.fromJson(entry.key, entry.value, options, true);
        })
        .where((x) => [
              FluggerDataType.OBJECT,
              FluggerDataType.ENUM,
            ].contains(x.dataType))
        .toList();

    _updateModelsReferences(models);

    return models;
  }

  void _updateModelsReferences(List<FluggerModel> models) {
    final rootModels = models
        .where((x) =>
            x.root &&
            [
              FluggerDataType.OBJECT,
              FluggerDataType.ENUM,
            ].contains(x.dataType))
        .toList();

    for (final model in models) {
      _updateModelReferences(model, rootModels);
    }
  }

  void _updateModelReferences(
      FluggerModel model, List<FluggerModel> rootModels) {
    if (model is ObjectFluggerModel) {
      for (final property in model.properties) {
        if (property is ReferenceFluggerModel) {
          property.reference =
              rootModels.firstWhere((x) => x.id == property.id);
        }
        if (property is ListFluggerModel &&
            property.templateDataType is ReferenceFluggerModel) {
          (property.templateDataType as ReferenceFluggerModel).reference =
              rootModels
                  .firstWhere((x) => x.id == property.templateDataType?.id);
        }
      }
    }
  }
}
