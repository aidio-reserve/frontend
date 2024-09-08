import 'package:aitrip/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider((ref) => AuthService());

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AsyncValue<User?>>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthStateNotifier(authService);
});

class AuthStateNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthService _authService;

  AuthStateNotifier(this._authService) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    final user = _authService.currentUser;
    if (user != null) {
      state = AsyncValue.data(user);
    } else {
      state = const AsyncValue.data(null);
    }
  }

  Future<UserCredential> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _authService.registerWithEmailAndPassword(email, password);
      state = AsyncValue.data(userCredential.user);
      return userCredential;
    } on FirebaseAuthException catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await _authService.signInWithEmailAndPassword(email, password);
      state = AsyncValue.data(userCredential.user);
      return userCredential;
    } on FirebaseAuthException catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    state = const AsyncValue.data(null);
  }
}
