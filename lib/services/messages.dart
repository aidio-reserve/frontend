import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Message {
  final String text;
  final bool isSender;
  final bool displayHotel;
  Message(
      {required this.text, required this.isSender, required this.displayHotel});
}

class MessageListNotifier extends StateNotifier<List<Message>> {
  final Ref ref;
  MessageListNotifier(this.ref)
      : super([
          Message(
              text:
                  " こんにちは！どのような旅行をご希望ですか？\n \n  例. \t 北海道で海鮮丼を食べたい！ \n  例. \t 森林浴がしたい",
              isSender: false,
              displayHotel: false)
        ]);

  void addMessage(String text, bool isSender, bool displayHotel) {
    state = [
      ...state,
      Message(text: text, isSender: isSender, displayHotel: displayHotel)
    ];
    debugPrint(
        'Updated Message List:【 ${state.map((message) => 'Text: ${message.text}, IsSender: ${message.isSender}, DisplayHotel: ${message.displayHotel}').toList()} 】');
  }
}
