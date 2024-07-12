import 'package:aitrip/providers/theme_provider.dart';
import 'package:aitrip/ui/screens/ai_screen/chat_screen.dart';
import 'package:aitrip/ui/screens/ai_screen/home_screen.dart';
import 'package:aitrip/ui/screens/ai_screen/voice_screen.dart';
import 'package:aitrip/ui/screens/drawer/bookmark_screen.dart';
import 'package:aitrip/ui/screens/drawer/manual_screen.dart';
import 'package:aitrip/ui/screens/drawer/profile_screen.dart';
import 'package:aitrip/ui/screens/firebase/login_screen.dart';
import 'package:aitrip/ui/screens/firebase/register_screen.dart';
import 'package:aitrip/ui/screens/setting_screen.dart';
import 'package:aitrip/ui/screens/settings/about_app_scren.dart';
import 'package:aitrip/ui/screens/settings/change_ai_name_screen.dart';
import 'package:aitrip/ui/screens/settings/change_user_name_screen.dart';
import 'package:aitrip/ui/screens/settings/display_voice_screen.dart';
import 'package:aitrip/ui/screens/settings/help_screen.dart';
import 'package:aitrip/ui/screens/settings/payment_method_screen.dart';
import 'package:aitrip/ui/screens/settings/privacy_policy_screen.dart';
import 'package:aitrip/ui/screens/settings/terms_of_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TripApp extends ConsumerWidget {
  final String threadId;
  const TripApp({super.key, required this.threadId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const seedColor = Colors.cyan;
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      routes: {
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/manual': (context) => const ManualScreen(),
        '/bookmark': (context) => const BookmarkScreen(),
        '/setting': (context) => const SettingScreen(),
        '/change_user_name': (context) => const ChangeUserNameScreen(),
        '/change_ai_name': (context) => const ChangeAiNameScreen(),
        '/display_voice': (context) => const DisplayVoiceScreen(),
        '/payment_method': (context) => const PaymentMethodScreen(),
        '/help': (context) => const HelpScreen(),
        '/about_app': (context) => const AboutAppScreen(),
        '/terms_of_service': (context) => const TermsOfServiceScreen(),
        '/privacy_policy': (context) => const PrivacyPolicyScreen(),
        '/home': (context) => const HomeScreen(),
        '/voice': (context) => const VoiceScreen(),
        '/chatting': (context) => ChatScreen(
              showAppBar: true,
            ),
      },
      title: '音声AIアプリ',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        brightness: Brightness.light,
        textTheme: GoogleFonts.kiwiMaruTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.kiwiMaruTextTheme(),
      ),
      themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
