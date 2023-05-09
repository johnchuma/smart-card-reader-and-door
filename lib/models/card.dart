import 'package:cardscanner/controller/card_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserCard {
  late String id;

  late String user;
  late int card;
  late int amount;

  late Timestamp createdAt;
  void addUserCard() {
    CardController().addCard(this);
  }

  void updateCard() {
    CardController().updateCard(this);
  }

  void deleteCard() {
    CardController().deleteCard(this);
  }

  UserCard(this.user, this.card);
  UserCard.fromdDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    user = documentSnapshot['user'];
    id = documentSnapshot['id'];
    card = documentSnapshot['card'];
    amount = documentSnapshot['amount'];
    createdAt = documentSnapshot['createdAt'];
  }
}
