import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  //プロパティを指定
  factory User({
    required String uid,
    required String name,
    required int age, // 1:male,2:female,3:other
    required String phoneNumber,
    required String address,
    @Default(false) bool isPremium,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    debugPrint('Document data: $data');
    debugPrint('uid: ${doc.id}');
    debugPrint('name: ${data['name']}');
    debugPrint('age: ${data['age']}');
    debugPrint('phoneNumber: ${data['phoneNumber']}');
    debugPrint('address: ${data['address']}');
    debugPrint('isPremium: ${data['isPremium']}');

    return User.fromJson({
      'uid': doc.id,
      'name': data['name'] ?? '',
      'age': data['age'] ?? 0,
      'phoneNumber': data['phoneNumber'] ?? '',
      'address': data['address'] ?? '',
      'isPremium': data['isPremium'] ?? false,
    });
  }
}
