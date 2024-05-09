import 'package:flutter/material.dart';

extension MapStringDynamicX on Map<String, dynamic>? {
  /// For parsing objects of some class type that has it's own parse (eg. fromJson method)
  T? parse<T>(String key, T? Function(Map<String, dynamic> map) parser) {
    return this == null
        ? null
        : this![key] != null
            ? parser.call(this![key])
            : null;
  }

  T? parseValue<T>(String key, [T? Function(dynamic map)? parser]) {
    return (this == null || this?[key] == null) ? null : parser?.call(this![key]) ?? this![key];
  }

  T? parseEnum<T, PT>(String key, [T? Function(PT index)? parser]) {
    return (this == null || this?[key] == null) ? null : parser?.call(this![key]) ?? this![key];
  }

  dynamic parseDouble(String key, [dynamic Function(dynamic map)? parser]) {
    try {
      final value = parseValue(key, parser);

      return value is int? ? value?.toDouble() : value;
    } catch (e) {
      return null;
    }
  }

  DateTime? parseDate(String key) {
    final value = parseValue(key, (x) => DateTime.parse(x));

    return value == null ? null : DateTime.parse('${value.toString()}Z').toLocal();
  }

  TimeOfDay? parseTime(String key) {
    return parseValue(key, (x) => parseTimeOfDay(x));
  }

  T? parseItem<T>(String key, [T? Function(Map<String, dynamic> map)? parser]) {
    return (this == null || this?[key] == null) ? null : parser?.call(this![key]) ?? this![key];
  }

  List<T> parseList<T>(String key, [T Function(Map<String, dynamic> map)? parser]) {
    return this?[key]?.map<T>((x) => parser?.call(x) ?? x as T)?.toList() ?? [];
  }
}

extension MapX on Map? {
  T? parse<T>(String key, T? Function(Map<String, dynamic> map) parser) {
    return this == null
        ? null
        : this![key] != null
            ? parser.call(this![key])
            : null;
  }

  T? parseValue<T>(String key, [T? Function(dynamic map)? parser]) {
    return (this == null || this?[key] == null) ? null : parser?.call(this![key]) ?? this![key];
  }

  DateTime? parseDate(String key) {
    return parseValue(key, (x) => DateTime.parse(x).toLocal());
  }

  TimeOfDay? parseTime(String key) {
    return parseValue(key, (x) => parseTimeOfDay(x));
  }

  List<T> parseList<T>(String key, [T Function(Map<String, dynamic> map)? parser]) {
    return this?[key]?.map<T>((x) => parser?.call(x) ?? x as T)?.toList() ?? [];
  }
}

List<T> parseList<T>(List<dynamic>? map, [T Function(Map<String, dynamic> map)? parser]) {
  return map?.map<T>((x) => parser?.call(x) ?? x as T).toList() ?? [];
}

TimeOfDay? parseTimeOfDay(String? value) => value != null ? TimeOfDay(hour: int.parse(value.split(':')[0]), minute: int.parse(value.split(':')[1])) : null;
  