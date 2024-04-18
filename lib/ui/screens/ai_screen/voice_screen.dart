import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoiceScreen extends ConsumerWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ここに音声入力されたテキストが表示されます。',
                ),
              ),
              const SizedBox(height: 160),
              IconButton(
                  icon: const Icon(
                    Icons.mic_rounded,
                    size: 100,
                  ),
                  onPressed: () {
                    //音声入力が開始される
                  }),
              const SizedBox(height: 40),
              TextButton(onPressed: () {}, child: const Text("リセット"))
            ],
          ),
        ),
      ),
    );
  }
}
