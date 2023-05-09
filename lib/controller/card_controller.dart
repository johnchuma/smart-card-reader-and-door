// ignore_for_file: avoid_print

import 'package:cardscanner/models/card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<UserCard>> cardsReceiver = Rx<List<UserCard>>([]);
  List<UserCard> get cards => cardsReceiver.value;

  @override
  void onInit() {
    cardsReceiver.bindStream(getCards());
    super.onInit();
  }

  void addCard(UserCard card) async {
    try {
      print("Hello");
      Timestamp timestamp = Timestamp.now();
      await firestore
          .collection("users")
          .doc(timestamp.toDate().toString())
          .set({
        "id": timestamp.toDate().toString(),
        "user": card.user,
        "amount": card.amount,
        "card": card.card,
        "createdAt": timestamp
      });
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  void updateCard(UserCard card) async {
    try {
      await firestore.collection("users").doc(card.id).update({
        "amount": card.amount,
      });
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  void deleteCard(UserCard card) async {
    try {
      await firestore.collection("users").doc(card.id).delete();
    } catch (e) {
      print(e);
    }
  }

  Stream<List<UserCard>> getCards() {
    return firestore
        .collection("users")
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<UserCard> cards = [];
      for (var element in querySnapshot.docs) {
        cards.add(UserCard.fromdDocumentSnapshot(element));
      }
      return cards;
    });
  }
}
