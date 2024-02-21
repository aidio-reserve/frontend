import 'dart:convert';

import 'package:aitrip/services/hotel_service.dart';
import 'package:aitrip/services/result_cut_service.dart';
import 'package:aitrip/ui/screens/loading_screen.dart';
import 'package:aitrip/ui/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aitrip/services/request_url_service.dart';

final aiScreenProvider = Provider((_) => AiScreen());

class AiScreen extends ConsumerWidget {
  AiScreen({super.key});
  final TextEditingController controller = TextEditingController();
  final hotelInfoResult = StateProvider<String?>((ref) => null);

  Future<void> _sendHotelInfoToAPI(WidgetRef ref, BuildContext context) async {
    final String hotelInfo = controller.text;
    final appId = dotenv.env['RAKUTEN_API_KEY'];
    final requestUrl = RequestUrlService.createRequestUrl(hotelInfo, appId!);
    debugPrint(requestUrl);
    // LoadingScreenに遷移
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()));

    final hotelService = HotelService();
    final String? response = await hotelService.sendHotelInfo(requestUrl);

    // JSONレスポンスを解析し、ホテルオブジェクトのリストを作成
    final jsonResponse = jsonDecode(response ?? '');
    List<Hotel> hotels = (jsonResponse['hotels'] as List).map((hotelData) {
      var hotelInfo = hotelData['hotel'][0]; // hotelBasicInfoとroomInfoが含まれている
      return Hotel.fromJson(hotelInfo);
    }).toList();

    // hotelMinChargeが小さい順にソートし、上位5つのホテルを選択
    hotels.sort((a, b) => a.hotelMinCharge.compareTo(b.hotelMinCharge));
    List<Hotel> topHotels = hotels.take(5).toList();

    // ResultScreenに遷移し、上位5つのホテルを表示
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(hotels: topHotels),
      ),
    );
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
                  onPressed: () async =>
                      await _sendHotelInfoToAPI(ref, context),
                  child: const Text('実行'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
