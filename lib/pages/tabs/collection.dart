// ignore_for_file: implementation_imports

import 'package:cardscanner/pages/widgets/heading.dart';
import 'package:cardscanner/pages/widgets/hint.dart';
import 'package:cardscanner/pages/widgets/transactions.dart';
import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  const Collection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              heading("Transaction history"),
              hint("Total cash: 20,000,000 TSH"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          transction("Francis Damian"),
          transction("Henrick Datsan"),
        ],
      ),
    );
  }
}
