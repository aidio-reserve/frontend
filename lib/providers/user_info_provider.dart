import 'package:aitrip/data/repositories/export_userinfo_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoProvider =
    StateNotifierProvider<UserInfoNotifier, Map<String, dynamic>>((ref) {
  return UserInfoNotifier();
});

class UserInfoNotifier extends StateNotifier<Map<String, dynamic>> {
  UserInfoNotifier() : super({});

  void updateUserInfo(String threadId, Map<String, dynamic> userInfo) {
    state[threadId] = userInfo;
    state = Map.from(state);
  }
}

final exportUserInfoProvider = Provider<ExportUserInfoRepository>((ref) {
  return ExportUserInfoRepository(ref: ref);
});

final userInfoNotifierProvider =
    StateNotifierProvider<UserInfoNotifier, Map<String, dynamic>>((ref) {
  return UserInfoNotifier();
});
