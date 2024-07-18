import 'package:aitrip/models/Users/Conversations/messages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageListProvider =
    StateNotifierProvider<MessageListNotifier, List<Message>>((ref) {
  return MessageListNotifier(ref);
});
