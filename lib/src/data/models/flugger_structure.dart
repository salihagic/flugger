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
  all_in_one_file('all_in_one_file'),

  /// Example:
  /// destinations_folder/account_update_request_model.dart
  /// destinations_folder/account_response_model.dart
  /// destinations_folder/orders_update_request_model.dart
  /// destinations_folder/orders_response_model.dart
  all_in_one_folder('all_in_one_folder');

  final String value;

  const FluggerStructureType(this.value);

  /// Parsing method used by this tool to parse the values from flugger.yaml file to strongly typed FluggerStructureType
  static FluggerStructureType parse(String? value) => switch (value) {
        'structured' => FluggerStructureType.structured,
        'all_in_one_file' => FluggerStructureType.all_in_one_file,
        'all_in_one_folder' => FluggerStructureType.all_in_one_folder,
        _ => FluggerStructureType.structured,
      };
}
