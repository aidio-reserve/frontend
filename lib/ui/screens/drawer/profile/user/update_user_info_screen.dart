import 'package:aitrip/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUserInfoScreen extends StatefulWidget {
  final String uid;
  const UpdateUserInfoScreen(this.uid, {super.key});

  @override
  UpdateUserInfoScreenState createState() => UpdateUserInfoScreenState();
}

class UpdateUserInfoScreenState extends State<UpdateUserInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _gender = '';

  Future<void> _saveUser() async {
    final userDb = FirebaseFirestore.instance;
    debugPrint('userDb:$userDb');

    final user = User(
      uid: widget.uid,
      name: _nameController.text,
      gender: _gender,
      age: _ageController.text.isEmpty ? "" : _ageController.text,
      address: _addressController.text.isEmpty ? "" : _addressController.text,
      phoneNumber: _phoneNumberController.text.isEmpty
          ? ""
          : _phoneNumberController.text,
    );

    debugPrint('widget.uid:${widget.uid}');

    try {
      await userDb
          .collection('users')
          .doc(widget.uid)
          .update(user.toJson())
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
                  labelText: '名前(必須)',
                ),
              ),
              const SizedBox(height: 8.0),
              const Text('性別(必須)'),
              RadioListTile<String>(
                title: const Text('男性'),
                value: '男性',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('女性'),
                value: '女性',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('回答したくない'),
                value: '回答したくない',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: '年齢(任意)',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: '住所(任意)',
                ),
              ),
              TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: '電話番号(任意)',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
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
