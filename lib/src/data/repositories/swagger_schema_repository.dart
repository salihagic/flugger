import 'package:dio/dio.dart';
import 'package:flugger/flugger.dart';

/// Swagger implementation of SchemaRepository that fetches the models schema from swagger.json and translates to local models
class SwaggerSchemaRepository implements SchemaRepository {
  /// Flugger options to read specified swagger url from where to fetch the schema
  final FluggerOptions options;

  /// http client to fetch the data
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

  /// Parsing schema from swagger version 2
  Future<List<Model>> _parseV2(Map<String, dynamic> data) async {
    return _parseModels(data['definitions']);
  }

  /// Parsing schema from swagger version 3
  Future<List<Model>> _parseV3(Map<String, dynamic> data) async {
    return _parseModels(data['components']['schemas']);
  }

  /// General swagger parse schema method
  Future<List<Model>> _parseModels(Map<String, dynamic> data) async {
    return data.entries
        .map<Model>(
          (entry) => Model.fromJson(entry.key, entry.value, options),
        )
        .where((Model x) => x.dataType == FluggerDataType.OBJECT)
        .toList();
  }

  /// Resolves swagger version
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
