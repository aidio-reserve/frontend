import 'package:aitrip/data/repositories/chat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoadingProvider = StateProvider<bool>((ref) => false);

final messageProvider = Provider<ChatRepository>((ref) {
  return ChatRepository(ref: ref);
});