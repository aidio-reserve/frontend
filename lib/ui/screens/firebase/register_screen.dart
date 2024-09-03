import 'package:aitrip/providers/auth_provider.dart';
import 'package:aitrip/ui/screens/drawer/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/register';
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> _register() async {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;

      UserCredential userCredential =
          await ref.read(authStateProvider.notifier).register(email, password);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()));
    } on FirebaseAuthException catch (e) {
      debugPrint('Registration error: ${e.message}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'エラー',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                    fontWeight: FontWeight.w500),
              ),
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              content: Text('メールアドレスまたはパスワードが正しくありません。',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  )),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      )),
                ),
              ],
            );
          });
    } catch (e) {
      debugPrint('Unexpected error: $e');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('エラー'),
              content: const Text('アカウント登録中にエラーが発生しました。'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント登録'),
        backgroundColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 40.0, bottom: 40, left: 70, right: 70),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                ),
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'パスワード',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
                obscuringCharacter: '●',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _register();
                },
                child: const Text('登録'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
