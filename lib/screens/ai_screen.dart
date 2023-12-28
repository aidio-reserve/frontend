import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiScreenProvider = Provider((_) => const AiScreen());

class AiScreen extends ConsumerWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('contents'),
      ),
    );
  }
}
