extension StringX on String? {
  String toSnakeCase() {
    final result = (this ?? '').replaceAllMapped(
      RegExp(r'[A-Z]'),
      (Match m) => '_${m[0]!.toLowerCase()}',
    );

    return result.startsWith('_')
        ? result.substring(1)
        : result.endsWith('_')
        ? result.substring(0, result.length - 2)
        : result;
  }
}
