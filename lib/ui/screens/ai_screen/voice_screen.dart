import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoiceScreen extends ConsumerWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: IconButton(
            icon: const Icon(
              Icons.mic_rounded,
              size: 100,
            ),
            onPressed: () {
              //音声入力が開始される
            }),
      ),
    );
  }
}
