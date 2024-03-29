import 'dart:convert';
import 'package:aitrip/providers/hotel_provider.dart';
import 'package:aitrip/services/hotel_service.dart';
import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:aitrip/ui/screens/loading_screen.dart';
import 'package:aitrip/ui/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    ref.read(hotelListProvider.notifier).state = topHotels;
    // ResultScreenに遷移
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const ResultScreen()));

    Hotel hotel = Hotel.fromJson(jsonResponse['hotels'][0]['hotel'][0]);
    debugPrint('Hotel Image URL: ${hotel.hotelImageUrl}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "メッセージを入力します",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//表示させられる会話の部分
class ChatMessage {
  final String content;
  final bool isUserMessage;

  ChatMessage({required this.content, required this.isUserMessage});
}

final chatMessageProvider =
    StateNotifierProvider<ChatMessageNotifier, List<ChatMessage>>((ref) {
  return ChatMessageNotifier();
});

class ChatMessageNotifier extends StateNotifier<List<ChatMessage>> {
  ChatMessageNotifier() : super([]);

  void addMessage(ChatMessage message) {
    state = [...state, message];
  }
}

class ConversationItem extends ConsumerWidget {
  final int messageIndex;

  const ConversationItem({Key? key, required this.messageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(chatMessageProvider)[messageIndex];

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: message.isUserMessage ? Colors.blue[100] : Colors.green[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: message.content));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Message copied to clipboard'),
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              message.isUserMessage ? Icons.person : Icons.stars,
              color: message.isUserMessage ? Colors.blue : Colors.green,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.isUserMessage ? 'You' : 'ChatGPT',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
