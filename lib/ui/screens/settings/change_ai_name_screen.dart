import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeAiNameScreen extends ConsumerWidget {
  const ChangeAiNameScreen({super.key});
  static const routeName = '/change_ai_name';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AIの名前を変更'),
      ),
      body: const Center(
        child: Text('これはAIの名前を変更するスクリーンです。'),
      ),
    );
  }
}
