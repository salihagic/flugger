/// Naming convention enum
enum FluggerFolderNamingConvention {
  /// Specify if the grouping folder for files should be resolved from group endpoints (eg. Account models will be in account/ folder)
  namespace('namespace'),

  /// Specify that all request models should be grouped in requests/ folder, response models grouped to responses/ folder and so on
  type('type');

  final String value;

  const FluggerFolderNamingConvention(this.value);

  /// Parsing method used by this tool to parse the values from flugger.yaml file to strongly typed FluggerFolderNamingConvention
  static FluggerFolderNamingConvention parse(String? value) => switch (value) {
        'namespace' => FluggerFolderNamingConvention.namespace,
        'type' => FluggerFolderNamingConvention.type,
        _ => FluggerFolderNamingConvention.type,
      };
}
