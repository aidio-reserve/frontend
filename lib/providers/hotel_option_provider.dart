import 'package:aitrip/providers/message_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelOptionProvider = StateProvider<Map<String, dynamic>>((ref) {
  final messageList = ref.watch(messageListProvider);
  return messageList.isNotEmpty
      ? messageList.last.hotelOption
      : <String, dynamic>{};
});
