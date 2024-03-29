import 'package:aitrip/data/repositories/get_hotel_repository.dart';
import 'package:aitrip/data/repositories/message_repository.dart';
import 'package:aitrip/services/hotel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiScreenProvider = Provider((_) => AiScreen());

class AiScreen extends ConsumerWidget {
  AiScreen({super.key});
  final TextEditingController hotelInfoController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final hotelInfoServiceProvider = Provider<HotelInfoRepository>((ref) {
    return HotelInfoRepository(HotelService());
  });
  final messageProvider = Provider<MessageRepository>((ref) {
    return MessageRepository();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                TextField(
                  controller: hotelInfoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ここに、楽天APIに渡すhotel infoを入力します。',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final hotelInfoService = ref.read(hotelInfoServiceProvider);
                    final String userInput = hotelInfoController.text;
                    await hotelInfoService.sendHotelInfoToAPI(
                        userInput, ref, context);
                  },
                  child: const Text('実行'),
                ),
                const SizedBox(height: 680),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          labelText: "メッセージを入力します",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () async {
                        final messageService = ref.read(messageProvider);
                        final String message = messageController.text;
                        messageController.clear();
                        await messageService.sendMessage(message);
                      },
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
