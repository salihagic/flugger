// ignore_for_file: constant_identifier_names

/// Enum to specify the structure of the output files/folders
enum FluggerStructureType {
  /// Example:
  /// destinations_folder/account/requests/account_update_request_model.dart
  /// destinations_folder/account/responses/account_response_model.dart
  /// destinations_folder/orders/requests/orders_update_request_model.dart
  /// destinations_folder/orders/responses/orders_response_model.dart
  structured('structured'),

  /// Example:
  /// destinations_folder/models.dart // Everything is generated in this file
  one_file('one_file'),

  /// Example:
  /// destinations_folder/account_update_request_model.dart
  /// destinations_folder/account_response_model.dart
  /// destinations_folder/orders_update_request_model.dart
  /// destinations_folder/orders_response_model.dart
  one_folder('one_folder');

  final String value;

  const FluggerStructureType(this.value);

  /// Parsing method used by this tool to parse the values from flugger.yaml file to strongly typed FluggerStructureType
  static FluggerStructureType parse(String? value) => switch (value) {
    'structured' => FluggerStructureType.structured,
    'one_file' => FluggerStructureType.one_file,
    'one_folder' => FluggerStructureType.one_folder,
    _ => FluggerStructureType.structured,
  };
}
