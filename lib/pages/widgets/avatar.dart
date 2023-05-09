import 'package:flutter/material.dart';

Widget avatar(String image, {double? size}) {
  return ClipOval(
    child: SizedBox(
        height: size ?? 50,
        width: size ?? 50,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        )),
  );
}
