import 'package:aitrip/providers/auth_provider.dart';
import 'package:aitrip/ui/screens/drawer/profile/ai/change_ai_info_screen.dart';
import 'package:aitrip/ui/screens/drawer/profile/user/change_user_info_screen.dart';
import 'package:aitrip/ui/screens/firebase/login_screen.dart';
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
    final authState = ref.watch(authStateProvider);

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
                      // トグルボタンでテーマを切り替える
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
            ListTile(
              leading: Icon(
                Icons.person_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              title: const Text(
                'ユーザー名の変更',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                final user = ref.read(authStateProvider).maybeWhen(
                      data: (user) => user,
                      orElse: () => null,
                    );
                if (user != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeUserInfoScreen(user.uid),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(
                Icons.support_agent_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              title: const Text(
                'AIの名前の変更',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                final user = ref.read(authStateProvider).maybeWhen(
                      data: (user) => user,
                      orElse: () => null,
                    );
                if (user != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeAiInfoScreen(user.uid),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(
                Icons.attach_money_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              title: const Text(
                '決済手段',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/payment_method');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.help_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              title: const Text(
                'ヘルプ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/help');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.description_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              title: const Text(
                'このアプリについて',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about_app');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.gavel_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              title: const Text(
                '利用規約',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/terms_of_service');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              title: const Text(
                'プライバシーポリシー',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary),
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
      height: 1.0,
    );
  }
}
