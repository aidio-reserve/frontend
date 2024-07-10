//Roomで言うと、Daoの役割を持つファイル
import 'package:aitrip/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> addUser(User user) async {
    final userMap = user.toJson();
    await db.collection("users").add(userMap).then((DocumentReference doc) =>
        debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<void> getUsers() async {
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        debugPrint("${doc.id} => ${doc.data()}");
      }
    });
  }
}
