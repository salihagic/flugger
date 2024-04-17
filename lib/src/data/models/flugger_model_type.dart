// ignore_for_file: constant_identifier_names

enum FluggerModelType {
  REQUEST('string'),
  RESPONSE('string'),
  SEARCH('string');

  final String value;

  const FluggerModelType(this.value);

  // TODO: Implement this
  static FluggerModelType parse(Map<String, dynamic> map) => FluggerModelType.REQUEST;
}
