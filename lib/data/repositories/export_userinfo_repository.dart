import 'package:aitrip/providers/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExportUserInfoRepository {
  final String apiEndpoint =
      'https://aidio-reserve-c0fdhwbwgbdpc9d8.japaneast-01.azurewebsites.net/export_userinfo';
  final http.Client httpClient;
  final Ref ref;

  ExportUserInfoRepository({required this.ref}) : httpClient = http.Client();

  Future<void> sendUserInfoRequest(String threadId) async {
    final Uri url = Uri.parse(apiEndpoint);

    try {
      final response = await httpClient.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'threadId': threadId,
        }),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        debugPrint('exportUserInfoの取得に成功しました');
        debugPrint('UserInfo: $responseData');
        ref
            .read(userInfoProvider.notifier)
            .updateUserInfo(threadId, responseData);
        //UserInfoを出力(stateにアクセス)
        Map<String, dynamic> updatedUserInfo =
            ref.read(userInfoProvider)[threadId];
        debugPrint('Updated UserInfo for $threadId:【 $updatedUserInfo 】');
      } else {
        debugPrint('exportUserInfoの取得に失敗しました: ${response.body}');
      }
    } catch (e) {
      debugPrint('exportUserInfoの取得中にエラーが発生しました: $e');
    }
  }
}
