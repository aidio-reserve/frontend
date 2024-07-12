import 'package:aitrip/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Firestoreからデータを取得するメソッド
  Future<List<User>> getUsersInfo() async {
    try {
      final snapShot = await fireStore.collection('users').get();
      final userList = <User>[];
      snapShot.docs.forEach((content) {
        userList.add(User.fromJson(content.data()));
      });
      return userList;
    } on FirebaseException catch (e) {
      throw e.toString();
    }
  }

  // Firestoreにデータを保存するメソッド
  Future<void> addUser(User user) async {
    try {
      await fireStore.collection('users').add(user.toJson());
    } on FirebaseException catch (e) {
      throw e.toString();
    }
  }
}
