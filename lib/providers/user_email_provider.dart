import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserEmailProvider = StreamProvider<String>((ref) {
  FirebaseAuth auth = FirebaseAuth.instance;

  return auth.authStateChanges().map((User? user) {
    return user?.email ?? 'Email not found';
  });
});
