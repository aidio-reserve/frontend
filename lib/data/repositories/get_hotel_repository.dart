import 'dart:convert';
import 'package:aitrip/providers/hotel_provider.dart';
import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:aitrip/services/returned_hotel_service.dart';
import 'package:aitrip/services/request_url_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HotelInfoRepository {
  final HotelService hotelService;
  final TextEditingController controller = TextEditingController();
  final hotelInfoResult = StateProvider<String?>((ref) => null);
  HotelInfoRepository(this.hotelService);

  Future<void> sendHotelInfoToAPI(
      String updatedUserInfo, WidgetRef ref, BuildContext context) async {
    final appId = dotenv.env['RAKUTEN_API_KEY'];
    if (appId == null) {
      debugPrint('APIキーが設定されていません');
      return;
    }
    final requestUrl =
        RequestUrlService.createRequestUrl(updatedUserInfo, appId);
    debugPrint('リクエストURL:$requestUrl');

    final hotelService = HotelService();
    final String? response = await hotelService.sendHotelInfo(requestUrl);

    final jsonResponse = jsonDecode(response ?? '');
    List<Hotel> hotels = (jsonResponse['hotels'] as List).map((hotelData) {
      var hotelInfo = hotelData['hotel'][0];
      return Hotel.fromJson(hotelInfo);
    }).toList();

    hotels.sort((a, b) => a.hotelMinCharge.compareTo(b.hotelMinCharge));
    List<Hotel> topHotels = hotels.take(5).toList();

    ref.read(hotelListProvider.notifier).state = topHotels;

    Hotel hotel = Hotel.fromJson(jsonResponse['hotels'][0]['hotel'][0]);
    debugPrint('Hotel Image URL: ${hotel.hotelImageUrl}');
  }
}
