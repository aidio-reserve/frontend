import 'package:aitrip/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider((ref) => AuthService());

// 認証状態を管理するプロバイダー
final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AsyncValue<User?>>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthStateNotifier(authService);
});

class AuthStateNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthService _authService;

  AuthStateNotifier(this._authService) : super(const AsyncValue.loading()) {
    // 初期状態を設定
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

  Future<void> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _authService.registerWithEmailAndPassword(email, password);
      state = AsyncValue.data(userCredential.user);
    } on FirebaseAuthException catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    state = const AsyncValue.data(null);
  }
}
