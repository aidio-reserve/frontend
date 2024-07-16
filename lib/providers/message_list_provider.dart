import 'package:aitrip/models/Users/Convresations/messages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageListProvider =
    StateNotifierProvider<MessageListNotifier, List<Message>>((ref) {
  return MessageListNotifier(ref);
});
