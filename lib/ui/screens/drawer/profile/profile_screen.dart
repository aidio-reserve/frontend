import 'package:aitrip/providers/auth_provider.dart';
import 'package:aitrip/providers/user_email_provider.dart';
import 'package:aitrip/ui/screens/drawer/profile/ai/add_ai_info_screen.dart';
import 'package:aitrip/ui/screens/drawer/profile/user/add_user_info_screen.dart';
import 'package:aitrip/ui/screens/firebase/login_screen.dart';
import 'package:aitrip/ui/screens/drawer/profile/user/update_user_info_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDocProvider =
    StreamProvider.family<DocumentSnapshot?, String>((ref, uid) {
  return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
});

final aiDocProvider = StreamProvider.family<QuerySnapshot?, String>((ref, uid) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('ai')
      .snapshots();
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
          final userDoc = ref.watch(userDocProvider(user.uid));
          final aiDoc = ref.watch(aiDocProvider(user.uid));
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'プロフィール',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
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
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 0,
                          maxHeight: MediaQuery.of(context).size.height * 0.35,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 30, right: 30, bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                userDoc.when(
                                  data: (doc) {
                                    if (doc == null || !doc.exists) {
                                      return Center(
                                          child: Column(
                                        children: [
                                          const SizedBox(height: 32),
                                          const Text(
                                              'ユーザー情報が未登録です。\nユーザー情報を登録することで、ホテルの予約の際に個人情報入力をスムーズに行うことができます。'),
                                          const SizedBox(height: 40),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddUserInfoScreen(
                                                              user.uid),
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
                                      ));
                                    } else {
                                      final userData =
                                          doc.data() as Map<String, dynamic>;
                                      final userEmailAsyncValue =
                                          ref.watch(currentUserEmailProvider);
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
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.10),
                                                Text(
                                                  '名前 : ${userData['name']}',
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
                                              userEmailAsyncValue.when(
                                                data: (email) {
                                                  const int maxLength = 16;
                                                  final displayEmail = email
                                                              .length >
                                                          maxLength
                                                      ? '${email.substring(0, maxLength)}...'
                                                      : email;
                                                  return Text(
                                                    'メールアドレス: $displayEmail',
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  );
                                                },
                                                loading: () =>
                                                    const CircularProgressIndicator(),
                                                error: (error, stack) => Text(
                                                    'メールアドレスの取得中にエラーが発生しました: $error'),
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
                                                '年齢 : ${userData['age']}歳',
                                                style: const TextStyle(
                                                    fontSize: 16),
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
                                                '住所 : ${userData['address']}',
                                                style: const TextStyle(
                                                    fontSize: 16),
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
                                                '電話番号 : ${userData['phoneNumber']}',
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ]),
                                          ]),
                                          const SizedBox(height: 16),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          UpdateUserInfoScreen(
                                                              user.uid),
                                                    ),
                                                  );
                                                },
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.update,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 8.0),
                                                    Text('ユーザー情報を更新する'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  error: (error, stackTrace) => Center(
                                    child: Text('エラーが発生しました：$error'),
                                  ),
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              aiDoc.when(
                                data: (querySnapshot) {
                                  if (querySnapshot == null ||
                                      querySnapshot.docs.isEmpty) {
                                    return Center(
                                        child: Column(
                                      children: [
                                        const SizedBox(height: 32),
                                        const Text(
                                            'AIのカスタマイズをすることができます。\nAIの名前や、話す速度の変更等ができます。'),
                                        const SizedBox(height: 40),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddAiInfoScreen(
                                                            user.uid),
                                                  ),
                                                );
                                              },
                                              child: const Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .precision_manufacturing_rounded,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Text('AIのカスタマイズに進む'),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                                  } else {
                                    final doc = querySnapshot.docs.first;
                                    final aiData =
                                        doc.data() as Map<String, dynamic>;
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
                                              'AIの情報',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
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
                                                'AIの名前 : ${aiData['aiName']}',
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
                                              'AIの声 : ${aiData['aiType']}',
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
                                              '話す速度 : ${aiData['aiSpeed']}',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ]),
                                        ]),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateUserInfoScreen(
                                                            user.uid),
                                                  ),
                                                );
                                              },
                                              child: const Row(
                                                children: [
                                                  Icon(
                                                    Icons.update,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Text('AI情報を更新する'),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }
                                },
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                error: (error, stackTrace) => Center(
                                  child: Text('エラーが発生しました：$error'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'ログアウト',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onErrorContainer,
                                    fontWeight: FontWeight.w500),
                              ),
                              content: Text('ログアウトしますか？',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onErrorContainer)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.errorContainer,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('キャンセル',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onErrorContainer
                                              .withOpacity(0.5))),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(authStateProvider.notifier)
                                        .signOut();
                                    Navigator.pop(context);
                                  },
                                  child: Text('ログアウト',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onErrorContainer)),
                                ),
                              ],
                            );
                          });
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
