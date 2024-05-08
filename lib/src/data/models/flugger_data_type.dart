// ignore_for_file: constant_identifier_names

/// Enum to specify and handle conversion of data types from sources to Dart
enum FluggerDataType {
  STRING('String'),
  DATETIME('DateTime'),
  INT('int'),
  DOUBLE('double'),
  BOOL('bool'),
  LIST('List'),
  ENUM('Enum'),
  OBJECT('Object');

  final String value;

  const FluggerDataType(this.value);

  static FluggerDataType parse(Map<String, dynamic> map) {
    if (map['type']?.toLowerCase().contains('.enums.') ?? false || map['\$ref']?.toLowerCase().contains('.enums.') ?? false) {
      return FluggerDataType.ENUM;
    }

    final type = switch (map['type']?.toLowerCase()) {
      'string' => map['format'] == 'date-time' ? FluggerDataType.DATETIME : FluggerDataType.STRING,
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
