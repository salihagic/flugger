enum FluggerFolderNamingConvention {
  namespace('namespace'),
  type('type');

  final String value;

  const FluggerFolderNamingConvention(this.value);

  static FluggerFolderNamingConvention parse(String? value) => switch (value) {
        'namespace' => FluggerFolderNamingConvention.namespace,
        'type' => FluggerFolderNamingConvention.type,
        _ => FluggerFolderNamingConvention.type,
      };
}
