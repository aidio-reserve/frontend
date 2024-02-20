import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aitrip/services/request_url_service.dart';

final aiScreenProvider = Provider((_) => AiScreen());

class AiScreen extends ConsumerWidget {
  AiScreen({super.key});
  final TextEditingController controller = TextEditingController();

  void _sendHotelInfoToAPI() {
    final String hotelInfo = controller.text;
    final appId = dotenv.env['APPLICATION_ID'];
    final requestUrl =
        RequestUrlService.createRequestUrl(hotelInfo, appId!); // リクエストURLの生成
    print(requestUrl); // 生成したリクエストURLをコンソールに出力
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
