import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aitrip/providers/theme_provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('設定'),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.person_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('ユーザー名の変更'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.support_agent_rounded,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  title: const Text('AIの名前の変更'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.monitor_rounded,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  title: const Text('画面・音声'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  leading: const Icon(
                    Icons.attach_money_rounded,
                    color: Colors.black,
                  ),
                  title: const Text('決済手段'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  leading: const Icon(
                    Icons.help_rounded,
                    color: Colors.black,
                  ),
                  title: const Text('ヘルプ'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  leading: const Icon(
                    Icons.description_rounded,
                    color: Colors.black,
                  ),
                  title: const Text('このアプリについて'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  leading: const Icon(
                    Icons.gavel_rounded,
                    color: Colors.black,
                  ),
                  title: const Text('利用規約'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  leading: const Icon(
                    Icons.privacy_tip_rounded,
                    color: Colors.black,
                  ),
                  title: const Text('プライバシーポリシー'),
                  onPressed: (context) {},
                ),
              ],
            ),
          ],
        )
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () => themeNotifier.toggleTheme(),
        //     child: const Text('テーマを切り替える'),
        //   ),
        // ),
        );
  }
}
