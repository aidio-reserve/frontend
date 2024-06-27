import 'package:aitrip/providers/message_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final displayHotelProvider = StateProvider<int>((ref) {
  final messageList = ref.watch(messageListProvider);
  return messageList.isNotEmpty ? messageList.last.displayHotel : 1;
});
