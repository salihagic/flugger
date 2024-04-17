// ignore_for_file: constant_identifier_names

import 'package:flugger/flugger.dart';

enum FluggerModelType {
  REQUEST('request'),
  RESPONSE('response'),
  SEARCH('search'),
  MODEL('model');

  final String value;

  const FluggerModelType(this.value);

  static FluggerModelType parse(String name, FluggerOptions options) {
    if ([
      options.request.name_part_to_remove,
      options.request.name_sufix,
      'Request',
    ].any((x) => name.contains(x))) {
      return FluggerModelType.REQUEST;
    }

    if ([
      options.response.name_part_to_remove,
      options.response.name_sufix,
      'Response',
    ].any((x) => name.contains(x))) {
      return FluggerModelType.RESPONSE;
    }

    if ([
      options.search.name_part_to_remove,
      options.search.name_sufix,
      'Search',
    ].any((x) => name.contains(x))) {
      return FluggerModelType.SEARCH;
    }

    return FluggerModelType.MODEL;
  }
}
