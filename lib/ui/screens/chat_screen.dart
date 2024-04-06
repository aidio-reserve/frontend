import 'package:aitrip/data/repositories/get_hotel_repository.dart';
import 'package:aitrip/data/repositories/chat_repository.dart';
import 'package:aitrip/models/messages.dart';
import 'package:aitrip/providers/thread_id_provider.dart';
import 'package:aitrip/services/hotel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

final chatScreenProvider = Provider((_) => ChatScreen());

class ChatScreen extends ConsumerWidget {
  ChatScreen({super.key});
  final TextEditingController hotelInfoController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final hotelInfoServiceProvider = Provider<HotelInfoRepository>((ref) {
    return HotelInfoRepository(HotelService());
  });
  final messageProvider = Provider<ChatRepository>((ref) {
    return ChatRepository(ref: ref);
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
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
                const SizedBox(height: 16),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.support_agent_rounded,
                          size: 30,
                        ),
                        const SizedBox(width: 8),
                        ChatBubble(
                          clipper: ChatBubbleClipper8(
                              type: BubbleType.receiverBubble),
                          backGroundColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          child: Text(
                            'こんにちは！どこに旅行に行きたいですか？',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Consumer(builder: (context, ref, _) {
                    final messages = ref.watch(messageListProvider);
                    return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return message.isSender
                              ? userRow(context, message.text)
                              : serverRow(context, message.text);
                        });
                  }),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
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
                final threadId = ref.read(threadIdProvider);
                final messageService = ref.read(messageProvider);
                final String message = messageController.text;
                if (message.isNotEmpty) {
                  // まずユーザーのメッセージをMessageListに追加
                  ref
                      .read(messageListProvider.notifier)
                      .addMessage(message, true);
                  debugPrint('ユーザーからのメッセージを追加しました: $message');

                  // メッセージをクリア
                  messageController.clear();

                  // メッセージ送信処理
                  debugPrint('送信したメッセージ: $message');
                  await messageService.sendMessage(threadId, message);
                }
                debugPrint('送信したメッセージ: $message');
                messageController.clear();
              },
            )
          ],
        )));
  }

  Widget userRow(BuildContext context, String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 20),
              backGroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                message,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Icon(
          Icons.face_rounded,
          size: 30,
        ),
      ],
    );
  }

  Widget serverRow(BuildContext context, String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.support_agent_rounded,
          size: 30,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 38.0),
            child: ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
              margin: const EdgeInsets.only(top: 20),
              backGroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child: Text(
                message,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiaryContainer),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
