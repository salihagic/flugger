// ignore_for_file: constant_identifier_names

enum FluggerDataType {
  STRING('String'),
  INT('int'),
  DOUBLE('double'),
  BOOL('bool'),
  LIST('List'),
  OBJECT('Object');

  final String value;

  const FluggerDataType(this.value);

  static FluggerDataType parse(Map<String, dynamic> map) => switch (map['type']?.toLowerCase()) {
        'string' => FluggerDataType.STRING,
        'int' => FluggerDataType.INT,
        'double' => FluggerDataType.DOUBLE,
        'boolean' => FluggerDataType.BOOL,
        'list' => FluggerDataType.LIST,
        'object' => FluggerDataType.OBJECT,
        null => FluggerDataType.OBJECT,
        _ => map['\$ref'].replaceAll('#/components/schemas/', '').split('.').last,
      };
}
