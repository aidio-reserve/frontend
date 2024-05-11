import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodScreen extends ConsumerWidget {
  const PaymentMethodScreen({super.key});
  static const routeName = '/payment_method';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('支払い方法'),
      ),
      body: const Center(
        child: Text('これは支払い方法スクリーンです。'),
      ),
    );
  }
}
