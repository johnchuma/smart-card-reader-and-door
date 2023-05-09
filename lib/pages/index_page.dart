// ignore_for_file: must_be_immutable

import 'package:cardscanner/pages/tabs/collection.dart';
import 'package:cardscanner/pages/tabs/dashboard.dart';
import 'package:cardscanner/pages/tabs/users.dart';
import 'package:cardscanner/utils/colors.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List tabs = [
    {"icon": Icons.home, "view": const Dashboard(), "title": "home"},
    {"icon": Icons.person, "view": const Users(), "title": "users"},
    {
      "icon": Icons.graphic_eq,
      "view": const Collection(),
      "title": "collections"
    },
  ];

  String current = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: tabs
                      .map((item) => Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = item['title'];
                                });
                              },
                              child: Icon(
                                item['icon'],
                                color: item['title'] == current
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height,
                color: main_color2,
                child: tabs
                    .where((item) => item['title'] == current)
                    .first['view'],
              ))
            ],
          )
        ],
      ),
    );
  }
}
