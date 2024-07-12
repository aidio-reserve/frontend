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
          final userData = ref.watch(userProvider(user.uid));
          return Scaffold(
            appBar: AppBar(
              title: const Text('プロフィール'),
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
            ),
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .inverseSurface
                            .withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 0,
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.35,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 30, right: 30, bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                userData.when(
                                  data: (user) {
                                    if (user == null) {
                                      return const Center(
                                          child: Text(
                                              'ユーザー情報が未登録です。\nユーザー情報を登録することで、ホテルの予約の際の個人情報入力がスムーズになります。'));
                                    }
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                            const Text(
                                              'ユーザー情報',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        const Divider(),
                                        const SizedBox(height: 4),
                                        Column(children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.10),
                                              Text(
                                                '名前 : ${user.name}',
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 2),
                                          const Divider(),
                                          const SizedBox(height: 2),
                                          Row(children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.10),
                                            Text(
                                              '住所 : ${user.address}',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ]),
                                          const SizedBox(height: 2),
                                          const Divider(),
                                          const SizedBox(height: 2),
                                          Row(children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.10),
                                            Text(
                                              '年齢 : ${user.age}歳',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ]),
                                          const SizedBox(height: 2),
                                          const Divider(),
                                          const SizedBox(height: 2),
                                          Row(children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.10),
                                            Text(
                                              '電話番号 : ${user.phoneNumber}',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ]),
                                        ]),
                                      ],
                                    );
                                  },
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  error: (error, stackTrace) => Center(
                                    child: Text('エラーが発生しました：$error'),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddUserInfoScreen(user.uid),
                                          ),
                                        );
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.person_add,
                                            size: 20,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text('ユーザー情報を登録する'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .inverseSurface
                            .withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            const Text("AIのカスタマイズに進む"),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddAiInfoScreen(user.uid),
                                  ),
                                );
                              },
                              child: const Text('AIのカスタマイズへ'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: const Text('ログアウト'),
                  ),
                ],
              ),
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
