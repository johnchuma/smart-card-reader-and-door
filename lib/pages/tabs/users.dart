// ignore_for_file: implementation_imports

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cardscanner/controller/card_controller.dart';
import 'package:cardscanner/models/card.dart';
import 'package:cardscanner/pages/widgets/heading.dart';
import 'package:cardscanner/pages/widgets/hint.dart';
import 'package:cardscanner/pages/widgets/paragraph.dart';
import 'package:cardscanner/pages/widgets/user.dart';
import 'package:cardscanner/utils/pictures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  TextEditingController userController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(Container(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: card,
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
                            heading("Add new user"),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: userController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(fontSize: 12),
                                  labelText: "Enter user name"),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: cardController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(fontSize: 12),
                                  labelText: "Enter card number"),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                UserCard card = UserCard(userController.text,
                                    int.parse(cardController.text));
                                card.amount = 0;
                                card.addUserCard();
                              },
                              child: Container(
                                color: Colors.black,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Center(
                                      child: paragraph("Add user",
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
          backgroundColor: Colors.black,
          child: const Icon(Icons.add)),
      body: GetX<CardController>(
          init: CardController(),
          builder: (find) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heading("Users"),
                      hint("Total users: ${find.cards.length}"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: find.cards
                        .map((card) => user(card, amountController))
                        .toList(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
