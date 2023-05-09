// ignore_for_file: implementation_imports

import 'package:cardscanner/controller/client_controller.dart';
import 'package:cardscanner/pages/index_page.dart';
import 'package:cardscanner/pages/login_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DecisionPage extends StatelessWidget {
  const DecisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ClientController>(
        init: ClientController(),
        builder: (find) {
          return find.user == null ? LoginPage() : const IndexPage();
        });
  }
}
