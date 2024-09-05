import 'package:aitrip/models/Users/user_info/address.dart';
import 'package:aitrip/models/Users/user_info/user.dart';
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
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  int _gender = 0;

  Future<void> _saveUser() async {
    final userDb = FirebaseFirestore.instance;
    final user = User(
      uid: widget.uid,
      name: _nameController.text,
      gender: _gender,
      age: _ageController.text.isEmpty
          ? 0
          : int.tryParse(_ageController.text) ?? 0,
      address: Address(
        postalCode: _postalCodeController.text.isEmpty
            ? ""
            : _postalCodeController.text,
        address: _addressController.text.isEmpty ? "" : _addressController.text,
        street: _streetController.text.isEmpty ? "" : _streetController.text,
      ),
      phoneNumber: _phoneNumberController.text.isEmpty
          ? ""
          : _phoneNumberController.text,
    );
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
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '名前(*)',
                ),
              ),
              const SizedBox(height: 8.0),
              const Text('性別'),
              RadioListTile<int>(
                title: const Text('男性'),
                value: 1,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              RadioListTile<int>(
                title: const Text('女性'),
                value: 2,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              RadioListTile<int>(
                title: const Text('未回答'),
                value: 3,
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
                  labelText: '年齢',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _postalCodeController,
                decoration: const InputDecoration(
                  labelText: '郵便番号',
                ),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: '住所',
                ),
              ),
              TextField(
                controller: _streetController,
                decoration: const InputDecoration(
                  labelText: '番地',
                ),
              ),
              TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: '電話番号',
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
