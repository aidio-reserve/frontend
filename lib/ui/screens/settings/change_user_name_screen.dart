import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aitrip/ui/screens/drawer/setting_screen.dart';

class ChangeUserNameScreen extends ConsumerWidget {
  const ChangeUserNameScreen({super.key});
  static const routeName = '/change_user_name';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingScreen()),
              );
            },
          ),
          title: const Text(
            'ユーザー名の変更',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
      ),
      body: const Center(
        child: Text('これはユーザー名を変更するスクリーンです。'),
      ),
    );
  }
}
