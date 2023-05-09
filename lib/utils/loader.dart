import 'package:flutter/material.dart';
import 'package:get/get.dart';

void launchLoader() {
  Get.defaultDialog(
      backgroundColor: Colors.transparent,
      title: "",
      content: Container(
        height: 50,
        width: 50,
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      ));
}
