import 'package:aitrip/services/make_thread_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final threadIdProvider = Provider<String>((ref) {
  return makeThreadId();
});
