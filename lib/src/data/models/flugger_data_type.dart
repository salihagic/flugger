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

  static FluggerDataType parse(Map<String, dynamic> map) {
    final type = switch (map['type']?.toLowerCase()) {
      'string' => FluggerDataType.STRING,
      'int' => FluggerDataType.INT,
      'integer' => FluggerDataType.INT,
      'double' => FluggerDataType.DOUBLE,
      'boolean' => FluggerDataType.BOOL,
      'list' => FluggerDataType.LIST,
      'array' => FluggerDataType.LIST,
      _ => FluggerDataType.OBJECT,
    };

    return type;
  }
}
