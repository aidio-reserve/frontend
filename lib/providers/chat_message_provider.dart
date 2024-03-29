import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aitrip/models/chat_message.dart';

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
