import 'package:aitrip/models/ai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//この画面は、最初の一回のみ。2回目以降やると、別のAI情報が生成される。
//2回目以降は、updateAiInfoScreenでupdateメソッドを実装する。

class AddAiInfoScreen extends StatefulWidget {
  final String uid;
  const AddAiInfoScreen(this.uid, {super.key});

  @override
  AddAiInfoScreenState createState() => AddAiInfoScreenState();
}

class AddAiInfoScreenState extends State<AddAiInfoScreen> {
  final TextEditingController _aiNameController = TextEditingController();
  final TextEditingController _aiTypeController = TextEditingController();
  final TextEditingController _aiSpeedController = TextEditingController();

  Future<void> _saveAi() async {
    final aiDb = FirebaseFirestore.instance;
    final aiId =
        aiDb.collection('ai').doc(widget.uid).collection('ai').doc().id;
    debugPrint('aiDb:$aiDb');

    final ai = Ai(
      aiId: aiId,
      aiName: _aiNameController.text,
      aiType: _aiTypeController.text,
      aiSpeed: _aiSpeedController.text,
    );

    debugPrint('aiId:$aiId');

    try {
      await aiDb
          .collection('users')
          .doc(widget.uid)
          .collection('ai')
          .doc(aiId)
          .set(ai.toJson(), SetOptions(merge: true))
          .onError((e, _) => debugPrint("Error: $e"));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('AI情報を保存しました')),
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
        title: const Text('AIのカスタマイズ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _aiNameController,
                decoration: const InputDecoration(
                  labelText: 'AIの名前',
                ),
              ),
              TextField(
                controller: _aiTypeController,
                decoration: const InputDecoration(
                  labelText: 'AIの声の種類',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _aiSpeedController,
                decoration: const InputDecoration(
                  labelText: 'AIの喋る速さ',
                ),
                keyboardType: TextInputType.phone,
              ),
              ElevatedButton(
                onPressed: _saveAi,
                child: const Text('保存'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
