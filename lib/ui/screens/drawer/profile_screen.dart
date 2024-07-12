import 'package:aitrip/providers/user_provider.dart';
import 'package:aitrip/ui/screens/firebase/add_ai_info_screen.dart';
import 'package:aitrip/ui/screens/firebase/add_user_info_screen.dart';
import 'package:aitrip/ui/screens/firebase/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final users = ref.watch(userProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('プロフィール'),
            ),
            body: Column(
              children: [
                Text('ユーザー情報：${user.email}'),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text('ログアウト'),
                ),
                const Text("ユーザー情報入力に進む"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddUserInfoScreen(user.uid)));
                  },
                  child: const Text('ユーザー情報入力へ'),
                ),
                const Text("AIのカスタマイズに進む"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddAiInfoScreen(user.uid)));
                  },
                  child: const Text('AIのカスタマイズへ'),
                ),
                Expanded(
                  child: users.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (users) {
                      if (users.isEmpty) {
                        return const Center(
                          child: Text('ユーザーが見つかりませんでした'),
                        );
                      }
                      debugPrint('ユーザーが見つかりました');
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          debugPrint('user:$user');
                          debugPrint('Rendering user: ${user.toString()}');
                          return ListTile(
                            title: Text(user.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Age: ${user.age}'),
                                Text('Phone: ${user.phoneNumber}'),
                                Text('Address: ${user.address}'),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    error: (error, stack) {
                      // エラーメッセージを詳細にログに出力
                      debugPrint('Error occurred: $error');
                      debugPrint('Stack trace: $stack');
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('エラーが発生しました：$error'),
                            ElevatedButton(
                              onPressed: () => ref.refresh(userProvider),
                              child: const Text('再読み込み'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text('エラーが発生しました。：$error')),
      ),
    );
  }
}
