import 'package:flutter/material.dart';

Widget heading(String text,
    {double? size, FontWeight? fontWeight, Color? color}) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.bold,
        fontSize: size ?? 20,
        color: color ?? Colors.black),
  );
}
