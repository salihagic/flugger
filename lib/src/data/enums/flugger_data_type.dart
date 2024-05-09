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
  OBJECT('Object'),
  REFERENCE('Reference');

  final String value;

  const FluggerDataType(this.value);

  static FluggerDataType parse(Map<String, dynamic> json) {
    return switch (json['type']) {
      'string' => FluggerDataType.STRING,
      'number' => FluggerDataType.DOUBLE,
      'integer' => FluggerDataType.INT,
      'boolean' => FluggerDataType.BOOL,
      'array' => FluggerDataType.LIST,
      'object' => FluggerDataType.OBJECT,
      _ => FluggerDataType.REFERENCE,
    };
  }
}
