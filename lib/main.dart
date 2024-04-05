import 'package:aitrip/data/repositories/start_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'trip_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  final startRepository = StartRepository();
  String threadId = makeThreadId();
  await dotenv.load();
  await startRepository.accessToStart(threadId);
  runApp(
    const ProviderScope(
      child: TripApp(),
    ),
  );
}

makeThreadId() {
  DateTime now = DateTime.now();
  String threadId = '${now.year}'
      '${now.month.toString().padLeft(2, '0')}'
      '${now.day.toString().padLeft(2, '0')}'
      '${now.hour.toString().padLeft(2, '0')}'
      '${now.minute.toString().padLeft(2, '0')}'
      '${now.second.toString().padLeft(2, '0')}';
  debugPrint(threadId);
  return threadId;
}
