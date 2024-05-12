import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayVoiceScreen extends ConsumerWidget {
  const DisplayVoiceScreen({super.key});
  static const routeName = '/display_voice';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('画面・音声'),
      ),
      body: const Center(
        child: Text('これは画面・音声に関するスクリーンです。'),
      ),
    );
  }
}
