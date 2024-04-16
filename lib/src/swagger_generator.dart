import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flugger/flugger.dart';

class SwaggerGenerator {
  final SwaggerGeneratorOptions options;

  SwaggerGenerator(this.options);

  FutureOr<void> build() async {
    log('BUILDING SWAGGER GENERATOR: ${options.url}');

    await _loadSwaggerModel();
  }

  Future<SwaggerModel> _loadSwaggerModel() async {
    log('BUILDING SWAGGER GENERATOR: ${options.url}');

    final response = await Dio().get(options.url);

    final swaggerModel = SwaggerModel.fromJson(response.data, options);

    final models = swaggerModel.schemas.where((x) => x.type == 'object').toList();

    for (final model in models) {
      print('-------------------------------------------------------------------');
      print(model.toJson());
      print('-------------------------------------------------------------------');
    }

    return swaggerModel;
  }
}
