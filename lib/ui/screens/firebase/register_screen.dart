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
              title: const Text('エラー'),
              content: Text(e.message.toString()),
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
    } catch (e) {
      debugPrint('Unexpected error: $e');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('エラー'),
              content: Text('アカウント登録中にエラーが発生しました。'),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _register();
                },
                child: const Text('登録'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
