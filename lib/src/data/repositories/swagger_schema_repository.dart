import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flugger/flugger.dart';

class SwaggerSchemaRepository implements SchemaRepository {
  final FluggerOptions options;
  final Dio dio;

  SwaggerSchemaRepository({
    required this.options,
    required this.dio,
  });

  @override
  Future<List<Model>> get() async {
    final response = await dio.get(options.swagger!.url);

    final List<Model> models = response.data['components']['schemas'].entries
        .map<Model>(
          (entry) => Model.fromJson(
            entry.key,
            entry.value,
            options,
          ),
        )
        .where((Model x) => x.dataType == FluggerDataType.OBJECT)
        .toList();

    for (final model in models) {
      log('-------------------------------------------------------------------');
      log(model.toJson().toString());
      log('-------------------------------------------------------------------');
    }

    return models;
  }
}
