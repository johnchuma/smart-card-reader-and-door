import 'package:cardscanner/pages/widgets/heading.dart';
import 'package:cardscanner/pages/widgets/hint.dart';
import 'package:flutter/material.dart';

Widget summaryCard(IconData icon, String description, String data) {
  return Expanded(
      child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            hint(description),
            const SizedBox(
              height: 5,
            ),
            heading(data),
          ],
        ),
      ),
    ),
  ));
}
