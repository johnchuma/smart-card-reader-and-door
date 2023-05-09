import 'package:flutter/material.dart';

Widget hint(String text, {double? size, FontWeight? fontWeight, Color? color}) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: size ?? 13,
        color: color ?? Colors.grey),
  );
}
