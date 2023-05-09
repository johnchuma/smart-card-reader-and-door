import 'package:flutter/material.dart';

Widget paragraph(String text,
    {double? size, FontWeight? fontWeight, Color? color}) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: size ?? 13,
        color: color ?? Colors.black),
  );
}
