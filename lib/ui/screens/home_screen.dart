import 'package:aitrip/providers/auth_state_provider.dart';
import 'package:aitrip/ui/screens/ai_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User?> user = ref.watch(authStateProvider);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    bool isUserLoggedIn = user.when(
      data: (User? user) => user != null,
      loading: () => false,
      error: (_, __) => false,
    );

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'みなモン',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: AiScreen(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: Text(
                        '音声AIアプリ',
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.description_rounded),
                    title: const Text('チュートリアル画面'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/start');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_center_rounded),
                    title: const Text('みなモンについて'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_rounded),
                    title: const Text('アプリの使い方'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        '/save',
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_rounded),
                    title: const Text('プロフィール'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        '/myPage',
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings_rounded),
                    title: const Text('設定'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        '/setting',
                      );
                    },
                  ),
                  if (!isUserLoggedIn)
                    ListTile(
                      leading: const Icon(Icons.login_rounded),
                      title: const Text('ログイン/登録'),
                      onTap: () async {
                        Navigator.pop(context);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(
                              actions: [
                                AuthStateChangeAction<SignedIn>(
                                    (context, state) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('ログインしました'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }),
                                AuthStateChangeAction<UserCreated>(
                                    (context, state) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('ログインしました'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }),
                              ],
                              providers: [
                                EmailAuthProvider(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  if (isUserLoggedIn)
                    ListTile(
                      leading: const Icon(Icons.logout_rounded),
                      title: const Text('ログアウト'),
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'ログアウト',
                                textAlign: TextAlign.center,
                              ),
                              content: const Text(
                                '本当にログアウトしますか？',
                                textAlign: TextAlign.center,
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(
                                      flex: 3,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('キャンセル'),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await FirebaseAuth.instance.signOut();
                                      },
                                      child: const Text('ログアウト'),
                                    ),
                                    const Spacer(
                                      flex: 3,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.description_rounded),
              title: const Text('このアプリについて'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/appInfo');
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_rounded),
              title: const Text('アプリを共有'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/shareApp');
              },
            ),
            ListTile(
              leading: const Icon(Icons.gavel_rounded),
              title: const Text('利用規約'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/termsOfService');
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_rounded),
              title: const Text('プライバシーポリシー'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/privacyPolicy');
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}