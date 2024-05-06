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

    return switch (_version(response.data)) {
      'v2' => _parseV2(response.data),
      'v3' => _parseV3(response.data),
      _ => throw UnsupportedError('Swagger version not supported.'),
    };
  }

  Future<List<Model>> _parseV2(Map<String, dynamic> data) async {
    return _parseModels(data['definitions']);
  }

  Future<List<Model>> _parseV3(Map<String, dynamic> data) async {
    return _parseModels(data['components']['schemas']);
  }

  Future<List<Model>> _parseModels(Map<String, dynamic> data) async {
    return data.entries
        .map<Model>(
          (entry) => Model.fromJson(entry.key, entry.value, options),
        )
        .where((Model x) => x.dataType == FluggerDataType.OBJECT)
        .toList();
  }

  String _version(Map<String, dynamic> data) {
    if (data['swagger'] != null && data['swagger'].startsWith('2')) {
      return 'v2';
    }

    if (data['openapi'] != null && data['openapi'].startsWith('3')) {
      return 'v3';
    }

    throw UnsupportedError('Swagger version not detected in swagger url.');
  }
}
