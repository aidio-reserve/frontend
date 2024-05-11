import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManualScreen extends ConsumerWidget {
  const ManualScreen({super.key});
  static const routeName = '/manual';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マニュアル'),
      ),
      body: const Center(
        child: Text('これはマニュアルスクリーンです。'),
      ),
    );
  }
}
