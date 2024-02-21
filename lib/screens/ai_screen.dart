import 'package:aitrip/services/hotel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aitrip/services/request_url_service.dart';

final aiScreenProvider = Provider((_) => AiScreen());

class AiScreen extends ConsumerWidget {
  AiScreen({super.key});
  final TextEditingController controller = TextEditingController();
  final hotelInfoResult = StateProvider<String?>((ref) => null);

  Future<void> _sendHotelInfoToAPI(WidgetRef ref) async {
    final String hotelInfo = controller.text;
    final appId = dotenv.env['RAKUTEN_API_KEY'];
    final requestUrl = RequestUrlService.createRequestUrl(hotelInfo, appId!);
    print(requestUrl);
    final hotelService = HotelService();
    await hotelService.sendHotelInfo(requestUrl);
    final String? response = await hotelService.sendHotelInfo(requestUrl);
    ref.read(hotelInfoResult.notifier).state = response;
    controller.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
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
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async => await _sendHotelInfoToAPI(ref),
                  child: const Text('実行'),
                ),
                const SizedBox(height: 100),
                Column(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final response = ref.watch(hotelInfoResult);
                        if (response != null) {
                          return Text(response);
                        } else {
                          return const Text('ホテル情報がここに表示されます。');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
