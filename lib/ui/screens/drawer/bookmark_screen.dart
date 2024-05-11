import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});
  static const routeName = '/bookmark';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ブックマーク'),
      ),
      body: const Center(
        child: Text('これはブックマークスクリーンです。'),
      ),
    );
  }
}
