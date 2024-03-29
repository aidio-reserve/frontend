import 'package:aitrip/providers/theme_provider.dart';
import 'package:aitrip/ui/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TripApp extends ConsumerWidget {
  const TripApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const seedColor = Colors.cyan;
    final theme = ref.watch(themeProvider);

    return MaterialApp(
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
