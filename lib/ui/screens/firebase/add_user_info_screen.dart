import 'package:aitrip/models/user/user.dart';
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

    final user = User(
      uid: widget.uid,
      name: _nameController.text,
      age: int.parse(_ageController.text), //ageは半角でないと保存されない
      phoneNumber: _phoneNumberController.text,
      address: _addressController.text,
    );

    debugPrint('widget.uid:${widget.uid}');

    try {
      await userDb
          .collection('users')
          .doc(widget.uid)
          .set(user.toJson(), SetOptions(merge: true))
          .onError((e, _) => debugPrint("Error: $e"));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ユーザー情報を保存しました')),
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('エラーが発生しました: $e')),
      );
      debugPrint('error:$e');
    }
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
