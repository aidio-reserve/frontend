import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aitrip/ui/screens/ai_screen/home_screen.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});
  static const routeName = '/settings';

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
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          title: const Text(
            '設定',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
         // SettingsListの代わりにListViewを使用
      // settings_uiパッケージを使わずにリストを作成
      body: ListView(
          children: [
          // 各SettingsTile.navigationの代わりにListTileを使用
            
                ListTile(
                  leading: Icon(
                    Icons.person_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30, // アイコンのサイズを大きくする
                  ),
                  title: const Text(
                    'ユーザー名の変更',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // フォントサイズを大きくして太字にする
                    ),
                  // 高さを大きくするためのパディングを追加
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary), // 右側にアイコンを追加
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/change_user_name');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.support_agent_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30, // アイコンのサイズを大きくする
                  ),
                  title: const Text(
                    'AIの名前の変更',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // フォントサイズを大きくして太字にする
                    ),
                  // 高さを大きくするためのパディングを追加
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary), // 右側にアイコンを追加
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/change_ai_name');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.monitor_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30, // アイコンのサイズを大きくする
                  ),
                  title: const Text(
                    '画面・音声',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // フォントサイズを大きくして太字にする
                    ),
                  // 高さを大きくするためのパディングを追加
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary), // 右側にアイコンを追加
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/display_voice');
                  },
                ),
                // 画面・音声と決済手段の間に線を追加
          buildSeparator(),
                ListTile(
                  leading: Icon(
                    Icons.attach_money_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30, // アイコンのサイズを大きくする
                  ),
                  title: const Text(
                    '決済手段',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // フォントサイズを大きくして太字にする
                    ),
                  // 高さを大きくするためのパディングを追加
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary), // 右側にアイコンを追加
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/payment_method');
                  },
                ),
                // 画面・音声と決済手段の間に線を追加
          buildSeparator(),
                ListTile(
                  leading: Icon(
                    Icons.help_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30, // アイコンのサイズを大きくする
                  ),
                  title: const Text(
                    'ヘルプ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // フォントサイズを大きくして太字にする
                    ),
                  // 高さを大きくするためのパディングを追加
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary), // 右側にアイコンを追加
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/help');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.description_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30, // アイコンのサイズを大きくする
                  ),
                  title: const Text(
                    'このアプリについて',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // フォントサイズを大きくして太字にする
                    ),
                  // 高さを大きくするためのパディングを追加
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary), // 右側にアイコンを追加
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/about_app');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.gavel_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30, // アイコンのサイズを大きくする
                  ),
                  title: const Text(
                    '利用規約',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // フォントサイズを大きくして太字にする
                    ),
                  // 高さを大きくするためのパディングを追加
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary), // 右側にアイコンを追加
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/terms_of_service');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.privacy_tip_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30, // アイコンのサイズを大きくする
                  ),
                  title: const Text(
                    'プライバシーポリシー',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // フォントサイズを大きくして太字にする
                    ),
                  // 高さを大きくするためのパディングを追加
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary), // 右側にアイコンを追加
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/privacy_policy');
                  },
                ),
              
            
          ],
        ));
  }
  Widget buildSeparator() {
    return Container(
      color: Colors.grey.shade300,
      height: 1.0, // セパレータの高さ
    );
  }
}
