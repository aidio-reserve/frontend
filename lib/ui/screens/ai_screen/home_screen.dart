import 'package:aitrip/ui/screens/ai_screen/chat_screen.dart';
import 'package:aitrip/ui/screens/ai_screen/voice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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

    void handleDragEnd(BuildContext context) { //ドラッグ時に遷移を行う関数、二重遷移を防ぐ。
      if (opacity > 0.5) {
        Navigator.push(
          context,
        MaterialPageRoute(
          builder: (context) => ChatScreen(
              showAppBar: true,
            ),
          ),
        );
      }
      hideOverlay();
    }

    void simulateVerticalDrag(BuildContext context) {
      showOverlay(context);
      updateOpacity(1.0);  // 完全にドラッグされた状態を模擬
      handleDragEnd(context);
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
              onTap: (){
                simulateVerticalDrag(context);  // ドラッグと同じ処理をするため、ここでドラッグを模擬
              },
              onVerticalDragUpdate: (details) {
                double delta = (details.primaryDelta ?? 0.0) / 100;
                showOverlay(context);
                updateOpacity(delta);
              },
              onVerticalDragEnd: (details) {
                handleDragEnd(context);
              },
              child: Icon(
                Icons.comment_rounded,
                color/* : isHovering
                      ? Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.7) */
                      : Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
