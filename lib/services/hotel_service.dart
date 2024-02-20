// services/hotel_service.dart
import 'package:http/http.dart' as http;

class HotelService {
  Future<void> sendHotelInfo(String hotelInfo) async {
    // APIリクエストを実装
    final response = await http.post(Uri.parse('楽天APIのエンドポイント'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: hotelInfo);

    if (response.statusCode == 200) {
      // リクエスト成功時の処理
    } else {
      // エラー処理
    }
  }
}
