// ignore_for_file: avoid_print

import 'package:cardscanner/utils/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User?> userReceiver = Rx<User?>(null);
  User? get user => userReceiver.value;

  @override
  void onInit() {
    userReceiver.bindStream(auth.userChanges());
    super.onInit();
  }

  void login(String email, String password) async {
    try {
      launchLoader();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.back();
    } catch (e) {
      Get.back();
      Get.snackbar("Error", "Failed to login");

      print(e);
    }
  }

  void logout() async {
    try {
      launchLoader();
      await auth.signOut();
      Get.back();
    } catch (e) {
      Get.back();

      Get.snackbar("Error", "Failed to logout");
      print(e);
    }
  }
}
