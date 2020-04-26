import 'package:flutter/material.dart';

final RegExp colorRegex = new RegExp(r"Color\(0xff(\w+)\)");
String getColorValue(Color color) {
  RegExpMatch match = colorRegex.firstMatch(color.toString());
  if (match != null) {
    return "#" + match.group(1);
  }
  return "";
}

String enumToString(Object name) {
  return name.toString().split('.')[1];
}
