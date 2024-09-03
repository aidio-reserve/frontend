import 'package:aitrip/services/make_thread_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final threadIdProvider = StateProvider<String>((ref) {
  return makeThreadId();
});
