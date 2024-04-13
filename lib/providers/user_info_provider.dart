import 'package:flutter_riverpod/flutter_riverpod.dart';

// UserInfoの状態を管理するためのプロバイダー
final userInfoProvider =
    StateNotifierProvider<UserInfoNotifier, Map<String, dynamic>>((ref) {
  return UserInfoNotifier();
});

// UserInfoの状態を管理するためのStateNotifier
class UserInfoNotifier extends StateNotifier<Map<String, dynamic>> {
  UserInfoNotifier() : super({});

  // UserInfoを追加または更新するメソッド
  void updateUserInfo(String threadId, Map<String, dynamic> userInfo) {
    state[threadId] = userInfo;
    state = Map.from(state); // 状態を更新してUIをリビルドする
  }

  // 特定のthreadIdに対するUserInfoを取得するメソッド
  Map<String, dynamic> getUserInfo(String threadId) {
    return state[threadId] ?? {};
  }

  // 最新のUserInfoを取得するメソッド
  Map<String, dynamic> getLatestUserInfo(String threadId) {
    if (state[threadId] != null && state[threadId].isNotEmpty) {
      return state[threadId].last;
    }
    return {};
  }
}
