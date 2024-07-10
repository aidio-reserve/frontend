import 'package:aitrip/data/firebase/firestore.dart';
import 'package:aitrip/data/repositories/start_repository.dart';
import 'package:aitrip/providers/thread_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'trip_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  // final firestoreService = FirestoreService();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
                  return TripApp(threadId: threadId);
                } else {
                  return const CircularProgressIndicator();
                }
              });
        },
      ),
    ),
  );
}
