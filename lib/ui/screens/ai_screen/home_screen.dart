// import 'package:aitrip/providers/auth_state_provider.dart';
import 'package:aitrip/ui/screens/ai_screen/chat_screen.dart';
import 'package:aitrip/ui/screens/ai_screen/voice_screen.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final AsyncValue<User?> user = ref.watch(authStateProvider);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    // bool isUserLoggedIn = user.when(
    //   data: (User? user) => user != null,
    //   loading: () => false,
    //   error: (_, __) => false,
    // );
    OverlayEntry? overlayEntry;
    double opacity = 0.0;

    void showOverlay(BuildContext context) {
      if (overlayEntry == null) {
        overlayEntry = OverlayEntry(
          builder: (context) => Opacity(
            opacity: opacity,
            child: ChatScreen(showAppBar: true),
          ),
        );
        Overlay.of(context).insert(overlayEntry!);
      }
    }

    hideOverlay() {
      if (overlayEntry != null) {
        overlayEntry?.remove();
        overlayEntry = null;
        opacity = 0.0;
      }
    }

    void updateOpacity(double delta) {
      if (overlayEntry == null) {
        showOverlay(context);
      }
      opacity = (opacity + delta).clamp(0.0, 1.0);
      overlayEntry?.markNeedsBuild();
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          '旅行アシスタント',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                double delta = (details.primaryDelta ?? 0.0) / 100;
                showOverlay(context);
                updateOpacity(delta);
              },
              onVerticalDragEnd: (details) {
                if (opacity > 0.5) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen(
                              showAppBar: true,
                            )),
                  );
                  hideOverlay();
                } else {
                  hideOverlay();
                }
              },
              child: Icon(
                Icons.schedule_rounded,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          )
        ],
      ),
      body: const VoiceScreen(),
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
                    leading: const Icon(Icons.person_rounded),
                    title: const Text('プロフィール'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.description_rounded),
                    title: const Text('マニュアル'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/manual');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark_rounded),
                    title: const Text('ブックマーク'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/bookmark');
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
                  // if (!isUserLoggedIn)
                  //   ListTile(
                  //     leading: const Icon(Icons.login_rounded),
                  //     title: const Text('ログイン/登録'),
                  //     onTap: () async {
                  //       Navigator.pop(context);
                  //       await Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => SignInScreen(
                  //             actions: [
                  //               AuthStateChangeAction<SignedIn>(
                  //                   (context, state) {
                  //                 ScaffoldMessenger.of(context).showSnackBar(
                  //                   const SnackBar(
                  //                     content: Text('ログインしました'),
                  //                     duration: Duration(seconds: 2),
                  //                   ),
                  //                 );
                  //                 Navigator.of(context).push(
                  //                   MaterialPageRoute(
                  //                     builder: (context) => const HomeScreen(),
                  //                   ),
                  //                 );
                  //               }),
                  //               AuthStateChangeAction<UserCreated>(
                  //                   (context, state) {
                  //                 ScaffoldMessenger.of(context).showSnackBar(
                  //                   const SnackBar(
                  //                     content: Text('ログインしました'),
                  //                     duration: Duration(seconds: 2),
                  //                   ),
                  //                 );
                  //                 Navigator.of(context).push(
                  //                   MaterialPageRoute(
                  //                     builder: (context) => const HomeScreen(),
                  //                   ),
                  //                 );
                  //               }),
                  //             ],
                  //             providers: [
                  //               EmailAuthProvider(),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // if (isUserLoggedIn)
                  //   ListTile(
                  //     leading: const Icon(Icons.logout_rounded),
                  //     title: const Text('ログアウト'),
                  //     onTap: () async {
                  //       await showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             title: const Text(
                  //               'ログアウト',
                  //               textAlign: TextAlign.center,
                  //             ),
                  //             content: const Text(
                  //               '本当にログアウトしますか？',
                  //               textAlign: TextAlign.center,
                  //             ),
                  //             actions: <Widget>[
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   const Spacer(flex: 3),
                  //                   TextButton(
                  //                     onPressed: () {
                  //                       Navigator.of(context).pop();
                  //                     },
                  //                     child: const Text('キャンセル'),
                  //                   ),
                  //                   const Spacer(flex: 1),
                  //                   TextButton(
                  //                     onPressed: () async {
                  //                       Navigator.of(context).pop();
                  //                       await FirebaseAuth.instance.signOut();
                  //                     },
                  //                     child: const Text('ログアウト'),
                  //                   ),
                  //                   const Spacer(flex: 3),
                  //                 ],
                  //               ),
                  //             ],
                  //           );
                  //         },
                  //       );
                  //     },
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
