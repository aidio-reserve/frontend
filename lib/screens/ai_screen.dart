import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiScreenProvider = Provider((_) => AiScreen());

class AiScreen extends ConsumerWidget {
  AiScreen({super.key});
  final TextEditingController controller = TextEditingController();

  void _sendHotelInfoToAPI() {
    final String hotelInfo = controller.text;
    // ここで hotelInfo を楽天APIに渡す処理を実装します
    print('送信されたホテル情報: $hotelInfo');

    // テキストフィールドをクリア
    controller.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ここに、楽天APIに渡すhotel infoを入力します。',
                ),
              ),
              const SizedBox(height: 16), // TextFieldとButtonの間にスペースを追加
              ElevatedButton(
                onPressed: _sendHotelInfoToAPI,
                child: const Text('実行'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
