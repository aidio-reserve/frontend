import 'package:http/http.dart' as http;

class HotelService {
  Future<void> sendHotelInfo(String requestUrl) async {
    // GETリクエストを実装
    final response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      // リクエスト成功時の処理: レスポンスボディをコンソールに出力
      print('レスポンスボディ: ${response.body}');
    } else {
      // エラー処理: エラーステータスコードをコンソールに出力
      print('エラー: ステータスコード ${response.statusCode}');
    }
  }
}
