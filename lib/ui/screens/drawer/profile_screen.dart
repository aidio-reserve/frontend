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
          // 現在ログインしているユーザーの UID を使用して userProvider を監視
          final userData = ref.watch(userProvider(user.uid));

          return userData.when(
            data: (user) {
              if (user == null) {
                return const Scaffold(
                  body: Center(child: Text('ユーザー情報が見つかりません')),
                );
              }
              return Scaffold(
                appBar: AppBar(
                  title: const Text('プロフィール'),
                ),
                body: Column(
                  children: [
                    Text('ユーザー情報：${user.name}'),
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
                            builder: (context) => AddUserInfoScreen(user.uid),
                          ),
                        );
                      },
                      child: const Text('ユーザー情報入力へ'),
                    ),
                    const Text("AIのカスタマイズに進む"),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddAiInfoScreen(user.uid),
                          ),
                        );
                      },
                      child: const Text('AIのカスタマイズへ'),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text(user.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Age: ${user.age}'),
                                Text('Phone: ${user.phoneNumber}'),
                                Text('Address: ${user.address}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stackTrace) => Scaffold(
              body: Center(child: Text('エラーが発生しました：$error')),
            ),
          );
        }
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text('エラーが発生しました：$error')),
      ),
    );
  }
}
