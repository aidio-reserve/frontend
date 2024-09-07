import 'package:aitrip/providers/auth_provider.dart';
import 'package:aitrip/ui/components/setting_list_method.dart';
import 'package:aitrip/ui/components/setting_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aitrip/ui/screens/ai_screen/home_screen.dart';
import 'package:aitrip/providers/theme_provider.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    ref.watch(authStateProvider);

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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Row(
                children: [
                  const Icon(Icons.sunny, size: 24),
                  const SizedBox(width: 16),
                  Switch(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      ref.read(themeModeProvider.notifier).toggleTheme();
                    },
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.nightlight, size: 24),
                ],
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            SettingListTile(
              title: 'ユーザー名の変更',
              iconName: Icons.person_rounded,
              onTap: () {
                SettingListMethod.onTapChangeUserNameTile(context, ref);
              },
            ),
            SettingListTile(
              title: 'AIの名前の変更',
              iconName: Icons.support_agent_rounded,
              onTap: () {
                SettingListMethod.onTapChangeAiNameTile(context, ref);
              },
            ),
            SettingListTile(
              title: '決済手段',
              iconName: Icons.attach_money_rounded,
              onTap: () {
                SettingListMethod.onTapPaymentTile(context);
              },
            ),
            SettingListTile(
              title: 'ヘルプ',
              iconName: Icons.help_rounded,
              onTap: () {
                SettingListMethod.onTapHelpTile(context);
              },
            ),
            SettingListTile(
              title: 'このアプリについて',
              iconName: Icons.description_rounded,
              onTap: () {
                SettingListMethod.onTapAboutAppTile(context);
              },
            ),
            SettingListTile(
              title: '利用規約',
              iconName: Icons.gavel_rounded,
              onTap: () {
                SettingListMethod.onTapTermsOfServiceTile(context);
              },
            ),
            SettingListTile(
              title: 'プライバシーポリシー',
              iconName: Icons.privacy_tip_rounded,
              onTap: () {
                SettingListMethod.onTapPrivacyPolicyTile(context);
              },
            ),
          ],
        ));
  }
}
