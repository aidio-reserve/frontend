import 'package:aitrip/models/Users/Conversations/messages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final displayHotelProvider = StateProvider<bool>((ref) {
  final messageList = ref.watch(messageListProvider);
  return messageList.isNotEmpty ? messageList.last.displayHotel : false;
});
