import 'package:aitrip/providers/theme_provider.dart';
import 'package:aitrip/ui/screens/ai_screen/chat_screen.dart';
import 'package:aitrip/ui/screens/ai_screen/home_screen.dart';
import 'package:aitrip/ui/screens/ai_screen/voice_screen.dart';
import 'package:aitrip/ui/screens/setting_screen.dart';
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
        // '/save': (context) => SaveScreen(),
        // '/myPage': (context) => MyPageScreen(),
        '/home': (context) => const HomeScreen(),
        '/setting': (context) => const SettingScreen(),
        '/voice': (context) => const VoiceScreen(),
        // '/appInfo': (context) => AppInfoScreen(),
        // '/shareApp': (context) => ShareAppScreen(),
        // '/termsOfService': (context) => TermsOfServiceScreen(),
        // '/privacyPolicy': (context) => PrivacyPolicyScreen(),
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
