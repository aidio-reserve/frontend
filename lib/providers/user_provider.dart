import 'package:aitrip/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider =
    StreamProvider.autoDispose.family<User?, String>((ref, uid) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .snapshots()
      .map((doc) {
    if (doc.exists) {
      final user = User.fromFirestore(doc);
      debugPrint('Fetched user: ${user.toString()}');
      return user;
    } else {
      return null;
    }
  });
});
