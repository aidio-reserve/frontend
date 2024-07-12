import 'package:aitrip/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StreamProvider<List<User>>((ref) {
  return FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      final user = User.fromFirestore(doc);
      debugPrint('Fetched user: ${user.toString()}');
      return user;
    }).toList();
  });
});
