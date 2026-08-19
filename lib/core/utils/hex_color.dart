import 'package:flutter/material.dart';

Color? hexToColor(String? hex) {
  if (hex == null) return null;

  var value = hex.trim().replaceFirst('#', '');
  if (value.isEmpty) return null;

  if (value.length == 3) {
    value = value.split('').map((c) => '$c$c').join();
  }
  if (value.length == 6) {
    value = 'ff$value';
  }
  if (value.length != 8) return null;

  final parsed = int.tryParse(value, radix: 16);
  return parsed == null ? null : Color(parsed);
}
