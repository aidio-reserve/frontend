import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('設定'),
        ),
        body: SettingsList(
          lightTheme: const SettingsThemeData(
            settingsListBackground: Color(0xFFF2F2F7),
            settingsSectionBackground: Colors.white,
          ),
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.person_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('ユーザー名の変更'),
                  onPressed: (context) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/change_user_name');
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.support_agent_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('AIの名前の変更'),
                  onPressed: (context) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/change_ai_name');
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.monitor_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('画面・音声'),
                  onPressed: (context) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/display_voice');
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.attach_money_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('決済手段'),
                  onPressed: (context) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/payment_method');
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.help_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('ヘルプ'),
                  onPressed: (context) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/help');
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.description_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('このアプリについて'),
                  onPressed: (context) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/about_app');
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.gavel_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('利用規約'),
                  onPressed: (context) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/terms_of_service');
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(
                    Icons.privacy_tip_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('プライバシーポリシー'),
                  onPressed: (context) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/privacy_policy');
                  },
                ),
              ],
            ),
          ],
        ));
  }
}