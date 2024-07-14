import 'package:aitrip/models/AI/ai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//この画面は、最初の一回のみ。2回目以降やると、別のAI情報が生成される。
//2回目以降は、updateAiInfoScreenでupdateメソッドを実装する。

class UpdateAiInfoScreen extends StatefulWidget {
  final String uid;
  const UpdateAiInfoScreen(this.uid, {super.key});

  @override
  UpdateAiInfoScreenState createState() => UpdateAiInfoScreenState();
}

class UpdateAiInfoScreenState extends State<UpdateAiInfoScreen> {
  final TextEditingController _aiNameController = TextEditingController();
  String _aiGender = '男';
  double _aiSpeed = 1.0;

  Future<void> _saveAi() async {
    final aiDb = FirebaseFirestore.instance;
    final aiId =
        aiDb.collection('ai').doc(widget.uid).collection('ai').doc().id;
    debugPrint('aiDb:$aiDb');

    final ai = Ai(
      aiId: aiId,
      aiName: _aiNameController.text,
      aiType: _aiGender,
      aiSpeed: _aiSpeed.toString(),
    );

    debugPrint('aiId:$aiId');

    try {
      await aiDb
          .collection('users')
          .doc(widget.uid)
          .collection('ai')
          .doc(aiId)
          .update(ai.toJson())
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
        title: const Text('AI情報の更新'),
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
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text('AIの声の種類: '),
                  Radio<String>(
                    value: '男声',
                    groupValue: _aiGender,
                    onChanged: (value) {
                      setState(() {
                        _aiGender = value!;
                      });
                    },
                  ),
                  const Text('男声'),
                  Radio<String>(
                    value: '女声',
                    groupValue: _aiGender,
                    onChanged: (value) {
                      setState(() {
                        _aiGender = value!;
                      });
                    },
                  ),
                  const Text('女声'),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  const Text('AIの喋る速さ: '),
                  Slider(
                    value: _aiSpeed,
                    min: 1.0,
                    max: 5.0,
                    divisions: 4,
                    label: _aiSpeed.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _aiSpeed = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
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
