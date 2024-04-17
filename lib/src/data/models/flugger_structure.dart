// ignore_for_file: constant_identifier_names

enum FluggerStructureType {
  structured('structured'),
  all_in_one_file('all_in_one_file'),
  all_in_one_folder('all_in_one_folder');

  final String value;

  const FluggerStructureType(this.value);

  static FluggerStructureType parse(String? value) => switch (value) {
        'structured' => FluggerStructureType.structured,
        'all_in_one_file' => FluggerStructureType.all_in_one_file,
        'all_in_one_folder' => FluggerStructureType.all_in_one_folder,
        _ => FluggerStructureType.structured,
      };
}
