import 'package:http/http.dart' as http;

class HotelService {
  Future<String?> sendHotelInfo(String requestUrl) async {
    final response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      // リクエスト成功時の処理: レスポンスボディをコンソールに出力
      return response.body;
    } else {
      // エラー処理: エラーステータスコードをコンソールに出力
      print('エラー: ステータスコード ${response.statusCode}');
      return null;
    }
  }
}
