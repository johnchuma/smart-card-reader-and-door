// ignore_for_file: implementation_imports

import 'package:cardscanner/controller/card_controller.dart';
import 'package:cardscanner/controller/client_controller.dart';
import 'package:cardscanner/pages/widgets/avatar.dart';
import 'package:cardscanner/pages/widgets/heading.dart';
import 'package:cardscanner/pages/widgets/hint.dart';
import 'package:cardscanner/pages/widgets/summary_card.dart';
import 'package:cardscanner/pages/widgets/transactions.dart';
import 'package:cardscanner/utils/pictures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<CardController>(
        init: CardController(),
        builder: (find) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heading("Dashboard"),
                        hint("Cardscanner Management system")
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        ClientController().logout();
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.power,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          heading("Logout", color: Colors.red, size: 12),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    avatar(tanzania)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    summaryCard(Icons.people, "Total registred users",
                        "${find.cards.length}"),
                    const SizedBox(
                      width: 20,
                    ),
                    summaryCard(
                        Icons.card_membership, "Cards scanned today", "55"),
                    const SizedBox(
                      width: 20,
                    ),
                    summaryCard(
                        Icons.today, "Todays collection", "500,000 TSH"),
                    const SizedBox(
                      width: 20,
                    ),
                    summaryCard(Icons.graphic_eq, "Monthly collection",
                        "5,000,000 TSH"),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                heading("Recent collection"),
                hint("These are the most recent transaction history"),
                const SizedBox(
                  height: 10,
                ),
                transction("Francis Damian",
                    second: "10020", fourth: "10 mins ago"),
                transction("Henrick Datsan",
                    second: "32309", fourth: "2 days ago"),
                transction("Atupye Tweve",
                    second: "23234", fourth: "7 days ago"),
              ],
            ),
          );
        });
  }
}
