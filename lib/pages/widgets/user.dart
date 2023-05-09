// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cardscanner/models/card.dart';
import 'package:cardscanner/pages/widgets/heading.dart';
import 'package:cardscanner/pages/widgets/paragraph.dart';
import 'package:cardscanner/utils/pictures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_color/random_color.dart';

Widget user(UserCard card, TextEditingController amountController) {
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
            paragraph(card.user),
            const SizedBox(
              width: 30,
            ),
            paragraph("#${card.card}"),
            const SizedBox(
              width: 30,
            ),
            paragraph("${card.amount}TSH"),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.bottomSheet(Container(
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl: recharge,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                heading("Recharge card"),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: amountController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelStyle: TextStyle(fontSize: 12),
                                      labelText: "Enter amount"),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    int newAmount = card.amount +
                                        int.parse(amountController.text);
                                    card.amount = newAmount;
                                    card.updateCard();
                                  },
                                  child: Container(
                                    color: Colors.black,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Center(
                                          child: paragraph("Recharge",
                                              color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.black,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: paragraph("Recharge", size: 11, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                card.deleteCard();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child:
                        paragraph("Delete card", size: 11, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
