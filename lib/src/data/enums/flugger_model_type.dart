// ignore_for_file: constant_identifier_names

import 'package:flugger/flugger.dart';

/// Enum to specify and handle model type
enum FluggerModelType {
  REQUEST('request'),
  RESPONSE('response'),
  SEARCH('search'),
  MODEL('model'),
  ENUM('enum'),
  BASIC('basic');

  final String value;

  const FluggerModelType(this.value);

  static FluggerModelType parse(String name, FluggerOptions options) {
    if ([
      options.request.name_part_to_remove,
      options.request.name_sufix,
      'Request',
    ].any(
      (x) => x.isNotEmpty && name.toLowerCase().contains(x.toLowerCase()),
    )) {
      return FluggerModelType.REQUEST;
    }

    if ([
      options.response.name_part_to_remove,
      options.response.name_sufix,
      'Response',
    ].any(
      (x) => x.isNotEmpty && name.toLowerCase().contains(x.toLowerCase()),
    )) {
      return FluggerModelType.RESPONSE;
    }

    if ([
      options.search.name_part_to_remove,
      options.search.name_sufix,
      'Search',
    ].any(
      (x) => x.isNotEmpty && name.toLowerCase().contains(x.toLowerCase()),
    )) {
      return FluggerModelType.SEARCH;
    }

    if ([
      options.model.name_part_to_remove,
      options.model.name_sufix,
      'Model',
    ].any(
      (x) => x.isNotEmpty && name.toLowerCase().contains(x.toLowerCase()),
    )) {
      return FluggerModelType.MODEL;
    }

    if ([
      options.enums.name_part_to_remove,
      options.enums.name_sufix,
      'Enum',
    ].any(
      (x) => x.isNotEmpty && name.toLowerCase().contains(x.toLowerCase()),
    )) {
      return FluggerModelType.ENUM;
    }

    return FluggerModelType.MODEL;
  }
}
