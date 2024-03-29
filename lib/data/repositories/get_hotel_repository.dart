// hotel_info_service.dart
import 'dart:convert';
import 'package:aitrip/providers/hotel_provider.dart';
import '../../../services/hotel_model_service.dart.dart';
import '../../../services/hotel_service.dart';
import 'package:aitrip/ui/screens/loading_screen.dart';
import 'package:aitrip/ui/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../services/request_url_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HotelInfoService {
  final HotelService hotelService;
  final TextEditingController controller = TextEditingController();
  final hotelInfoResult = StateProvider<String?>((ref) => null);
  HotelInfoService(this.hotelService);

  Future<void> sendHotelInfoToAPI(WidgetRef ref, BuildContext context) async {
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

    ref.read(hotelListProvider.notifier).state = topHotels;
    // ResultScreenに遷移
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const ResultScreen()));

    Hotel hotel = Hotel.fromJson(jsonResponse['hotels'][0]['hotel'][0]);
    debugPrint('Hotel Image URL: ${hotel.hotelImageUrl}');
  }
}
