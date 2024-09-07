import 'package:aitrip/providers/auth_provider.dart';
import 'package:aitrip/ui/screens/drawer/profile/ai/change_ai_info_screen.dart';
import 'package:aitrip/ui/screens/drawer/profile/user/change_user_info_screen.dart';
import 'package:aitrip/ui/screens/firebase/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingListMethod {
  //ユーザー名の変更のタイルをタップしたとき
  static onTapChangeUserNameTile(BuildContext context, WidgetRef ref) {
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
  }

  //AIの名前の変更のタイルをタップしたとき
  static onTapChangeAiNameTile(BuildContext context, WidgetRef ref) {
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
  }

  static onTapPaymentTile(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed('/payment_method');
  }

  static onTapHelpTile(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed('/help');
  }

  static onTapAboutAppTile(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/about_app');
  }

  static onTapTermsOfServiceTile(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/terms_of_service');
  }

  static onTapPrivacyPolicyTile(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/privacy_policy');
  }
}
