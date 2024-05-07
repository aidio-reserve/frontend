import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Message {
  final String text;
  final bool isSender;
  Message({required this.text, required this.isSender});
}

class MessageListNotifier extends StateNotifier<List<Message>> {
  MessageListNotifier()
      : super([Message(text: "こんにちは！どこに旅行に行きたいですか？", isSender: false)]);

  void addMessage(String text, bool isSender) {
    state = [...state, Message(text: text, isSender: isSender)];
    debugPrint(
        'Updated Message List: ${state.map((message) => 'Text: ${message.text}, IsSender: ${message.isSender}').toList()}');
  }
}

final messageListProvider =
    StateNotifierProvider<MessageListNotifier, List<Message>>((ref) {
  return MessageListNotifier();
});
