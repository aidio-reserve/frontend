import 'package:aitrip/providers/theme_provider.dart';
import 'package:aitrip/ui/screens/ai_screen/chat_screen.dart';
import 'package:aitrip/ui/screens/ai_screen/home_screen.dart';
import 'package:aitrip/ui/screens/ai_screen/voice_screen.dart';
import 'package:aitrip/ui/screens/drawer/bookmark_screen.dart';
import 'package:aitrip/ui/screens/drawer/manual_screen.dart';
import 'package:aitrip/ui/screens/drawer/profile/ai/change_ai_info_screen.dart';
import 'package:aitrip/ui/screens/drawer/profile/profile_screen.dart';
import 'package:aitrip/ui/screens/drawer/profile/user/change_user_info_screen.dart';
import 'package:aitrip/ui/screens/drawer/setting_screen.dart';
import 'package:aitrip/ui/screens/firebase/login_screen.dart';
import 'package:aitrip/ui/screens/firebase/register_screen.dart';
import 'package:aitrip/ui/screens/settings/about_app_screen.dart';
import 'package:aitrip/ui/screens/settings/display_voice_screen.dart';
import 'package:aitrip/ui/screens/settings/help_screen.dart';
import 'package:aitrip/ui/screens/settings/payment_method_screen.dart';
import 'package:aitrip/ui/screens/settings/privacy_policy_screen.dart';
import 'package:aitrip/ui/screens/settings/terms_of_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AidioReserve extends ConsumerWidget {
  final String threadId;
  const AidioReserve({super.key, required this.threadId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const seedColor = Colors.cyan;
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      routes: {
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/manual': (context) => const ManualScreen(),
        '/bookmark': (context) => const BookmarkScreen(),
        '/setting': (context) => const SettingScreen(),
        '/display_voice': (context) => const DisplayVoiceScreen(),
        '/payment_method': (context) => const PaymentMethodScreen(),
        '/help': (context) => const HelpScreen(),
        '/about_app': (context) => const AboutAppScreen(),
        '/terms_of_service': (context) => const TermsOfServiceScreen(),
        '/privacy_policy': (context) => const PrivacyPolicyScreen(),
        '/home': (context) => const HomeScreen(),
        '/voice': (context) => const VoiceScreen(),
        '/chatting': (context) => ChatScreen(showAppBar: true),
      },
      title: 'aidio-reserve',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        brightness: Brightness.light,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.grey[600]),
        ),
        textTheme: GoogleFonts.kiwiMaruTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        brightness: Brightness.dark,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.grey[300]),
        ),
        textTheme: GoogleFonts.kiwiMaruTextTheme(),
      ),
      themeMode: themeMode,
      home: const HomeScreen(),
    );
  }
}
