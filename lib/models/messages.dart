import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Message {
  final String text;
  final bool isSender;
  final int displayHotel;
  Message(
      {required this.text, required this.isSender, required this.displayHotel});
}

class MessageListNotifier extends StateNotifier<List<Message>> {
  final Ref ref;
  MessageListNotifier(this.ref)
      : super([
          Message(
              text: "こんにちは！どこに旅行に行きたいですか？", isSender: false, displayHotel: 0)
        ]);

  void addMessage(String text, bool isSender, int displayHotel) {
    state = [
      ...state,
      Message(text: text, isSender: isSender, displayHotel: displayHotel)
    ];
    debugPrint(
        'Updated Message List:【 ${state.map((message) => 'Text: ${message.text}, IsSender: ${message.isSender}, DisplayHotel: ${message.displayHotel}').toList()} 】');
  }
}
