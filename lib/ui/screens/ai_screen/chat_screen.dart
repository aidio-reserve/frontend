import 'dart:convert';

import 'package:aitrip/data/repositories/export_userinfo_repository.dart';
import 'package:aitrip/data/repositories/get_hotel_repository.dart';
import 'package:aitrip/data/repositories/chat_repository.dart';
import 'package:aitrip/models/messages.dart';
import 'package:aitrip/providers/message_loading_provider.dart';
import 'package:aitrip/providers/thread_id_provider.dart';
import 'package:aitrip/providers/user_info_provider.dart';
import 'package:aitrip/services/hotel_service.dart';
import 'package:aitrip/ui/components/chat_bubble.dart';
import 'package:aitrip/ui/screens/ai_screen/home_screen.dart';
import 'package:aitrip/ui/screens/ai_screen/voice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatScreenProvider = Provider((_) => ChatScreen(
      showAppBar: true,
    ));

class ChatScreen extends ConsumerWidget {
  ChatScreen({super.key, required this.showAppBar});
  final bool showAppBar;
  final TextEditingController hotelInfoController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final hotelInfoServiceProvider = Provider<HotelInfoRepository>((ref) {
    return HotelInfoRepository(HotelService());
  });
  final messageProvider = Provider<ChatRepository>((ref) {
    return ChatRepository(ref: ref);
  });
  final exportUserInfoProvider = Provider<ExportUserInfoRepository>((ref) {
    return ExportUserInfoRepository(ref: ref);
  });
  final userInfoNotifierProvider =
      StateNotifierProvider<UserInfoNotifier, Map<String, dynamic>>((ref) {
    return UserInfoNotifier();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: showAppBar
            ? AppBar(
                title: Text(
                  "会話履歴",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ))
            : null,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Expanded(child: Consumer(builder: (context, ref, _) {
                  final messages = ref.watch(messageListProvider);
                  final isLoading = ref.watch(isLoadingProvider);

                  return ListView.builder(
                    itemCount: messages.length + 1 + (isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return initialRow(context);
                      } else if (index == messages.length + 1 && isLoading) {
                        return loadingMessageRow(context);
                      }
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
                //threadIdProviderを使用してスレッドIDを取得
                final threadId = ref.read(threadIdProvider);
                //messageProviderを使用してChatRepositoryを取得
                final messageService = ref.read(messageProvider);
                //messageControllerからユーザーのメッセージを取得
                final String userMessage = messageController.text;
                //exportUserInfoProviderを使用してExportUserInfoRepositoryを取得(UserInfoを取得するため)
                final userInfoService = ref.read(exportUserInfoProvider);
                //hotelInfoServiceProviderを使用してHotelInfoRepositoryを取得(実際に楽天APIにリクエストを送信するため)
                final hotelInfoService = ref.read(hotelInfoServiceProvider);
                //userInfoNotifierProviderを使用してUserInfoNotifierを取得(最新のUserInfoを取得してUIに表示させるため)
                final userInfoNotifier =
                    ref.watch(userInfoNotifierProvider.notifier);
                if (userMessage.isNotEmpty) {
                  ref
                      .read(messageListProvider.notifier)
                      .addMessage(userMessage, true);
                  showLoading(ref);
                  await messageService.sendMessage(threadId, userMessage);
                  messageController.clear();
                  await userInfoService.sendUserInfoRequest(threadId);
                  Map<String, dynamic> updatedUserInfo =
                      ref.read(userInfoProvider)[threadId];
                  String jsonUpdatedUserInfo = jsonEncode(updatedUserInfo);
                  await hotelInfoService.sendHotelInfoToAPI(
                      jsonUpdatedUserInfo, ref, context);
                }
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
