import 'package:aitrip/data/repositories/get_hotel_repository.dart';
import 'package:aitrip/data/repositories/chat_repository.dart';
import 'package:aitrip/models/messages.dart';
import 'package:aitrip/providers/message_loading_provider.dart';
import 'package:aitrip/providers/thread_id_provider.dart';
import 'package:aitrip/services/hotel_service.dart';
import 'package:aitrip/ui/components/chat_bubble.dart';
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
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Icon(
                    //       Icons.support_agent_rounded,
                    //       size: 30,
                    //     ),
                    //     const SizedBox(width: 8),
                    //     ChatBubble(
                    //       clipper: ChatBubbleClipper8(
                    //           type: BubbleType.receiverBubble),
                    //       backGroundColor:
                    //           Theme.of(context).colorScheme.tertiaryContainer,
                    //       child: Text(
                    //         'こんにちは！どこに旅行に行きたいですか？',
                    //         style: TextStyle(
                    //           color: Theme.of(context)
                    //               .colorScheme
                    //               .onTertiaryContainer,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                Expanded(child: Consumer(builder: (context, ref, _) {
                  final messages = ref.watch(messageListProvider);
                  final isLoading = ref.watch(isLoadingProvider);

                  return ListView.builder(
                    itemCount: messages.length +
                        1 +
                        (isLoading ? 1 : 0), // 初期行のために+1、ローディングのために条件付きで+1
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // 最初の行に特別なウィジェット（initialRow）を配置
                        return initialRow(context); // 実際のinitialRowウィジェットをここに配置
                      } else if (index == messages.length + 1 && isLoading) {
                        // リストの最後でisLoadingがtrueの場合、ローディング行を表示
                        return loadingMessageRow(context);
                      }
                      // それ以外の場合、メッセージを表示
                      // indexが1から始まるため、メッセージのインデックスを調整
                      final message = messages[index - 1];
                      return message.isSender
                          ? userRow(context, message.text)
                          : serverRow(context, message.text);
                    },
                  );
                }))
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
                final String userMessage = messageController.text;

                if (userMessage.isNotEmpty) {
                  showLoading(ref).then((_) {
                    messageService.sendMessage(threadId, userMessage);
                  });
                  ref
                      .read(messageListProvider.notifier)
                      .addMessage(userMessage, true);
                  debugPrint('ユーザーからのメッセージを追加しました: $userMessage');
                  messageController.clear();
                  debugPrint('送信したメッセージ: $userMessage');
                }
                messageController.clear();
              },
            )
          ],
        )));
  }

  Future<void> showLoading(WidgetRef ref) async {
    ref.read(isLoadingProvider.notifier).state = true;
    debugPrint('isLoadingがtrueになりました');
  }
}
