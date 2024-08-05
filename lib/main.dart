import 'package:aitrip/data/repositories/start_repository.dart';
import 'package:aitrip/providers/thread_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'aidio_reserve.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/firebase/firebase_options.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'web/assets/.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugPrint('Firebase initialized');

  // WebViewプラットフォームの初期化を追加
  WebViewPlatform.instance = WebWebViewPlatform();

  runApp(
    ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          final threadId = ref.watch(threadIdProvider);
          final startRepository = StartRepository();

          return FutureBuilder(
              future: startRepository.accessToStart(threadId),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AidioReserve(threadId: threadId);
                } else {
                  return const CircularProgressIndicator();
                }
              });
        },
      ),
    ),
  );
}
