import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

//backendから帰ってきたホテルの情報に関するもの。
class HotelService {
  var logger = Logger();

  Future<String?> sendHotelInfo(String requestUrl) async {
    final response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      logger.e('エラー: ステータスコード ${response.statusCode}');
      return null;
    }
  }
}
