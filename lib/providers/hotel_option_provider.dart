import 'package:aitrip/models/Users/Conversations/messages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelOptionProvider = StateProvider<Map<String, dynamic>>((ref) {
  final messageList = ref.watch(messageListProvider);
  return messageList.isNotEmpty
      ? messageList.last.hotelOption
      : <String, dynamic>{};
});
