import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aitrip/providers/theme_provider.dart';

final myPageProvider = ChangeNotifierProvider((ref) => MyPageNotifier());

class MyPageNotifier extends ChangeNotifier {}

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});
  static const routeName = '/my-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => themeNotifier.toggleTheme(),
          child: const Text('テーマを切り替える'),
        ),
      ),
    );
  }
}
