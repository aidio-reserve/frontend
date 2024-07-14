import 'package:aitrip/providers/auth_provider.dart';
import 'package:aitrip/ui/screens/ai_screen/home_screen.dart';
import 'package:aitrip/ui/screens/firebase/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> _login() async {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;
      debugPrint('email:$email');
      debugPrint('password:$password');

      await ref.read(authStateProvider.notifier).login(email, password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        _showErrorDialog('そのメールアドレスのユーザーが見つかりません。');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        _showErrorDialog('パスワードが間違っています。');
      } else {
        debugPrint('Login error: ${e.message}');
        _showErrorDialog('メールアドレスまたはパスワードが間違っています。\nアカウントが存在しない場合は登録してください。');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ログインエラー'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('aidioにログイン'),
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
                  _login();
                },
                child: const Text('ログイン'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                },
                child: const Text('アカウントをお持ちでない場合 登録'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
