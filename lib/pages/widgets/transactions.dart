// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cardscanner/pages/widgets/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

Widget transction(String user,
    {String? second, String? third, String? fourth}) {
  RandomColor random = RandomColor();
  Color color = random.randomColor();
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Row(
          children: [
            ClipOval(
                child: Container(
                    color: color.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.person, color: color),
                    ))),
            const SizedBox(
              width: 30,
            ),
            paragraph(user),
            const SizedBox(
              width: 30,
            ),
            paragraph(second ?? "#3203920"),
            const SizedBox(
              width: 30,
            ),
            paragraph(third ?? "650TSH"),
            const SizedBox(
              width: 30,
            ),
            paragraph(fourth ?? "20min ago"),
          ],
        ),
      ),
    ),
  );
}
