import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeUserNameScreen extends ConsumerWidget {
  const ChangeUserNameScreen({super.key});
  static const routeName = '/change_user_name';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザーネームを変更'),
      ),
      body: const Center(
        child: Text('これはユーザーネームを変更するスクリーンです。'),
      ),
    );
  }
}
