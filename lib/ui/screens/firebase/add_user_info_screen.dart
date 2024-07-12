// import 'package:aitrip/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserInfoScreen extends StatefulWidget {
  final String uid;
  const AddUserInfoScreen(this.uid, {super.key});

  @override
  AddUserInfoScreenState createState() => AddUserInfoScreenState();
}

class AddUserInfoScreenState extends State<AddUserInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> _saveUser() async {
    final userDb = FirebaseFirestore.instance;
    debugPrint('userDb:$userDb');
    // try {
    // final user = User(
    //   name: _nameController.text,
    //   email: "", // ここにユーザーのメールアドレスを設定してください
    //   password: "", // パスワードはここで扱わない場合は、空のままにしておいてください
    //   age: int.parse(_ageController.text),
    //   phoneNumber: _phoneNumberController.text,
    //   address: _addressController.text,
    // );

    final data = {
      'name': _nameController.text,
      // 'email': "", // ここにユーザーのメールアドレスを設定してください
      // 'password': "", // パスワードはここで扱わない場合は、空のままにしておいてください
      // 'age': int.parse(_ageController.text),
      // 'phoneNumber': _phoneNumberController.text,
      // 'address': _addressController.text,
    };
    debugPrint('widget.uid:${widget.uid}');

    final collection = userDb.collection('users');
    debugPrint('collection:$collection');

    await collection
        .doc(widget.uid)
        .update(data)
        .onError((e, _) => debugPrint("Error updating document: $e"));

    final userReference = userDb.collection('users').doc(widget.uid);
    debugPrint('userReference:$userReference');

    await userReference
        .update(data)
        .onError((e, _) => debugPrint("Error updating document: $e"));

    await userDb
        .collection('users')
        .doc(widget.uid)
        .update(data)
        .onError((e, _) => debugPrint("Error: $e"));

    // userDb
    //     .collection('users')
    //     .doc(widget.uid)
    //     .set(user.toJson(), SetOptions(merge: true));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ユーザー情報を保存しました')),
    );
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('エラーが発生しました: $e')),
    //   );
    //   debugPrint('error:$e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー情報入力'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '名前',
                ),
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: '年齢',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: '電話番号',
                ),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: '住所',
                ),
              ),
              ElevatedButton(
                onPressed: _saveUser,
                child: const Text('保存'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
