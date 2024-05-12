import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutAppScreen extends ConsumerWidget {
  const AboutAppScreen({super.key});
  static const routeName = '/about_app';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アプリについて'),
      ),
      body: const Center(
        child: Text('このアプリについてのスクリーンです。'),
      ),
    );
  }
}
